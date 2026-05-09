#!/bin/sh
set -eu

is_rkipc_running() {
	ps | awk 'NR > 1 { cmd = $5; if (cmd == "rkipc" || cmd ~ "/rkipc$") found = 1 } END { exit found ? 0 : 1 }'
}

print_rkipc_processes() {
	ps | awk 'NR > 1 { cmd = $5; if (cmd == "rkipc" || cmd ~ "/rkipc$") print }'
}

wait_for_rkipc_exit() {
	attempts="${1:-15}"
	i=0
	while [ "$i" -lt "$attempts" ]; do
		if ! is_rkipc_running; then
			return 0
		fi
		i=$((i + 1))
		sleep 1
	done
	return 1
}

if is_rkipc_running; then
	echo "[1/3] Stop rkipc gracefully"
	killall -TERM rkipc 2>/dev/null || true
	if ! wait_for_rkipc_exit 25; then
		echo "rkipc did not exit within the expected time. Current processes:"
		print_rkipc_processes || true
		exit 1
	fi
else
	echo "[1/3] No running rkipc process detected. Continue with resource switch-back."
fi

echo "[2/2] Done"
echo "System is back to ai-core baseline state."
