#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$SCRIPT_DIR"

SRC_AI_CORE="$ROOT_DIR/InternalProjects/ai_core/service/build/ai-core"
SRC_GUARD="$ROOT_DIR/InternalProjects/guard/build/guard"
SRC_FW_DIR="$ROOT_DIR/InternalProjects/bt_service/bt/rk96x_bt_bin"
SRC_SHARE_ALSA="$ROOT_DIR/InternalProjects/bt_service/bt/external/out/usr/share/alsa"
SRC_SHARE_DBUS="$ROOT_DIR/InternalProjects/bt_service/bt/external/out/usr/share/dbus-1"

DST_OEM_BIN="$ROOT_DIR/project/oem/bin"
DST_OEM_FW="$ROOT_DIR/project/oem/firmware"
DST_OEM_SHARE="$ROOT_DIR/project/oem/share"

echo "[prefill] 回填到 project/oem ..."
mkdir -p "$DST_OEM_BIN" "$DST_OEM_FW" "$DST_OEM_SHARE/alsa" "$DST_OEM_SHARE/dbus-1"

# ai-core / guard: prefer InternalProjects, fallback to existing OEM copy.
if [[ -f "$SRC_AI_CORE" ]]; then
  install -m 0755 "$SRC_AI_CORE" "$DST_OEM_BIN/ai-core"
elif [[ ! -f "$DST_OEM_BIN/ai-core" ]]; then
  echo "ERROR: missing ai-core in both InternalProjects and project/oem/bin" >&2
  exit 1
fi

if [[ -f "$SRC_GUARD" ]]; then
  install -m 0755 "$SRC_GUARD" "$DST_OEM_BIN/guard"
elif [[ ! -f "$DST_OEM_BIN/guard" ]]; then
  echo "ERROR: missing guard in both InternalProjects and project/oem/bin" >&2
  exit 1
fi

# Bluetooth firmware: each required file must exist in InternalProjects or OEM fallback.
for fw in rk962_bt_v2.bin rk962_bt_rf_v2.bin rk96x_bt_loader.bin; do
  if [[ -f "$SRC_FW_DIR/$fw" ]]; then
    install -m 0644 "$SRC_FW_DIR/$fw" "$DST_OEM_FW/$fw"
  elif [[ ! -f "$DST_OEM_FW/$fw" ]]; then
    echo "ERROR: missing firmware $fw in both InternalProjects and project/oem/firmware" >&2
    exit 1
  fi
done

# Bluetooth share resources: prefer InternalProjects, fallback to existing OEM share.
if [[ -d "$SRC_SHARE_ALSA" ]]; then
  rsync -a --delete "$SRC_SHARE_ALSA/" "$DST_OEM_SHARE/alsa/"
elif [[ ! -d "$DST_OEM_SHARE/alsa" ]]; then
  echo "ERROR: missing ALSA share in both InternalProjects and project/oem/share/alsa" >&2
  exit 1
fi

if [[ -d "$SRC_SHARE_DBUS" ]]; then
  rsync -a --delete "$SRC_SHARE_DBUS/" "$DST_OEM_SHARE/dbus-1/"
elif [[ ! -d "$DST_OEM_SHARE/dbus-1" ]]; then
  echo "ERROR: missing D-Bus share in both InternalProjects and project/oem/share/dbus-1" >&2
  exit 1
fi

echo "[prefill] 完成。"
