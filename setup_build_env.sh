#!/usr/bin/env bash
set -euo pipefail

PACKAGES=(
  texinfo
  gperf
  g++-multilib
  gcc-multilib
  flex
  bison
  libgmp-dev
  libmpc-dev
  libmpfr-dev
  bc
  libncurses-dev
  libncurses5
  libncurses5:i386
  python-is-python3
  libssl-dev
  device-tree-compiler
  cmake
)

if ! command -v apt-get >/dev/null 2>&1; then
  echo "ERROR: 当前系统没有 apt-get，脚本仅支持 Debian/Ubuntu 系。"
  exit 1
fi

SUDO=""
if [ "$(id -u)" -ne 0 ]; then
  if command -v sudo >/dev/null 2>&1; then
    SUDO="sudo"
  else
    echo "ERROR: 需要 root 权限或 sudo。"
    exit 1
  fi
fi

echo "[1/3] 启用 i386 架构"
$SUDO dpkg --add-architecture i386

echo "[2/3] 更新软件源索引"
$SUDO apt-get update

echo "[3/3] 安装编译依赖"
$SUDO apt-get install -y "${PACKAGES[@]}"

echo "完成：编译环境依赖已安装。"
