#!/bin/sh
set -eu

RKIPC_LOG_DIR="${RKIPC_LOG_DIR:-/userdata/log}"
RKIPC_LOG_FILE="${RKIPC_LOG_FILE:-$RKIPC_LOG_DIR/rkipc.log}"
RKIPC_LOG_MAX_BYTES="${RKIPC_LOG_MAX_BYTES:-1048576}"
RKIPC_LOG_KEEP_BYTES="${RKIPC_LOG_KEEP_BYTES:-262144}"
RKIPC_LOG_CHECK_LINES="${RKIPC_LOG_CHECK_LINES:-200}"

is_rkipc_running() {
	ps | awk 'NR > 1 { cmd = $5; if (cmd == "rkipc" || cmd ~ "/rkipc$") found = 1 } END { exit found ? 0 : 1 }'
}

is_rkipc_runtime_ready() {
	[ -S /var/tmp/rkipc ]
}

wait_for_rkipc_ready() {
	attempts="${1:-15}"
	i=0
	while [ "$i" -lt "$attempts" ]; do
		if is_rkipc_running && is_rkipc_runtime_ready; then
			return 0
		fi
		i=$((i + 1))
		sleep 1
	done
	return 1
}

discard_stdin() {
	while IFS= read -r _line; do
		:
	done
}

rotate_rkipc_log_if_needed() {
	if [ ! -f "$RKIPC_LOG_FILE" ]; then
		return 0
	fi

	size="$(wc -c < "$RKIPC_LOG_FILE" 2>/dev/null || echo 0)"
	size="$(printf '%s' "$size" | tr -d '[:space:]')"
	case "$size" in
		''|*[!0-9]*)
			return 0
			;;
	esac

	if [ "$size" -le "$RKIPC_LOG_MAX_BYTES" ]; then
		return 0
	fi

	tmp_file="${RKIPC_LOG_FILE}.tmp.$$"
	if tail -c "$RKIPC_LOG_KEEP_BYTES" "$RKIPC_LOG_FILE" > "$tmp_file" 2>/dev/null; then
		mv "$tmp_file" "$RKIPC_LOG_FILE"
	else
		rm -f "$tmp_file"
	fi
}

rkipc_log_writer() {
	lines=0

	if ! mkdir -p "$RKIPC_LOG_DIR" 2>/dev/null; then
		discard_stdin
		return 0
	fi

	if ! : >> "$RKIPC_LOG_FILE" 2>/dev/null; then
		discard_stdin
		return 0
	fi

	rotate_rkipc_log_if_needed

	while IFS= read -r line || [ -n "$line" ]; do
		printf '%s\n' "$line" >> "$RKIPC_LOG_FILE" 2>/dev/null || continue
		lines=$((lines + 1))
		if [ "$lines" -ge "$RKIPC_LOG_CHECK_LINES" ]; then
			lines=0
			rotate_rkipc_log_if_needed
		fi
	done

	rotate_rkipc_log_if_needed
}

prepare_rkipc_log() {
	if mkdir -p "$RKIPC_LOG_DIR" 2>/dev/null && : >> "$RKIPC_LOG_FILE" 2>/dev/null; then
		rotate_rkipc_log_if_needed
		echo "rkipc log: $RKIPC_LOG_FILE"
		return 0
	fi

	echo "Warning: cannot write $RKIPC_LOG_FILE; rkipc stdout/stderr will be discarded."
	return 1
}

prepare_ini() {
	cp /oem/usr/share/rkipc-1920x1080.ini /tmp/rkipc-test.ini
	chmod 666 /tmp/rkipc-test.ini

	if sed -n '/^\[audio\.0\]/,/^\[/{/^[[:space:]]*source *=/p;}' /tmp/rkipc-test.ini | grep -q .; then
		sed -i '/^\[audio\.0\]/,/^\[/{s/^[[:space:]]*source *=.*/source = ai_core_mirror/;}' /tmp/rkipc-test.ini
	elif grep -q '^\[audio\.0\]' /tmp/rkipc-test.ini; then
		sed -i '/^\[audio\.0\]/a source = ai_core_mirror' /tmp/rkipc-test.ini
	fi

	set_video_source_key() {
		key="$1"
		value="$2"
		if sed -n '/^\[video\.source\]/,/^\[/{/^[[:space:]]*'"$key"' *=/p;}' /tmp/rkipc-test.ini | grep -q .; then
			sed -i '/^\[video\.source\]/,/^\[/{s/^[[:space:]]*'"$key"' *=.*/'"$key"' = '"$value"'/;}' /tmp/rkipc-test.ini
		elif grep -q '^\[video\.source\]' /tmp/rkipc-test.ini; then
			sed -i '/^\[video\.source\]/a '"$key"' = '"$value"'' /tmp/rkipc-test.ini
		fi
	}

	set_video_source_key source ai_core_h265_shm
	set_video_source_key enable_ivs 0
	set_video_source_key enable_jpeg 0
	set_video_source_key enable_venc_0 0
	set_video_source_key enable_venc_1 0
	set_video_source_key enable_venc_2 0
	set_video_source_key enable_npu 0

	if sed -n '/^\[video\.source\]/,/^\[/{/^[[:space:]]*enable_rtmp *=/p;}' /tmp/rkipc-test.ini | grep -q .; then
		sed -i '/^\[video\.source\]/,/^\[/{s/^[[:space:]]*enable_rtmp *=.*/enable_rtmp = 0/;}' /tmp/rkipc-test.ini
	elif grep -q '^\[video\.source\]' /tmp/rkipc-test.ini; then
		sed -i '/^\[video\.source\]/a enable_rtmp = 0' /tmp/rkipc-test.ini
	fi

	if sed -n '/^\[isp\]/,/^\[/{/^[[:space:]]*init_from_ini *=/p;}' /tmp/rkipc-test.ini | grep -q .; then
		sed -i '/^\[isp\]/,/^\[/{s/^[[:space:]]*init_from_ini *=.*/init_from_ini = 0/;}' /tmp/rkipc-test.ini
	elif grep -q '^\[isp\]' /tmp/rkipc-test.ini; then
		sed -i '/^\[isp\]/a init_from_ini = 0' /tmp/rkipc-test.ini
	fi

	grep -n 'init_from_ini' /tmp/rkipc-test.ini || true
	grep -n 'source *= *ai_core_mirror' /tmp/rkipc-test.ini || true
	grep -n 'source *= *ai_core_h265_shm' /tmp/rkipc-test.ini || true
	grep -n 'enable_rtmp *= *0' /tmp/rkipc-test.ini || true
}

echo "[1/3] Prepare /tmp/rkipc-test.ini"
prepare_ini

if is_rkipc_running; then
	echo "rkipc is already running. Stop it first if you want a clean runtime."
	exit 1
fi

echo "[2/3] Start rkipc"
rm -f /var/tmp/rkipc /tmp/rkipc.log
trap '' HUP
if prepare_rkipc_log; then
	(
		trap '' HUP
		nohup /oem/usr/bin/rkipc -c /tmp/rkipc-test.ini -a /etc/iqfiles -l 2 2>&1 | rkipc_log_writer
	) >/dev/null 2>&1 &
else
	nohup /oem/usr/bin/rkipc -c /tmp/rkipc-test.ini -a /etc/iqfiles -l 2 >/dev/null 2>&1 &
fi
sleep 3

if ! wait_for_rkipc_ready 15; then
	echo "rkipc startup timed out. Tail of $RKIPC_LOG_FILE:"
	tail -n 120 "$RKIPC_LOG_FILE" 2>/dev/null || true
	exit 1
fi

echo "[3/3] Verify runtime state"
echo "rkipc is now running. Local checks passed."
