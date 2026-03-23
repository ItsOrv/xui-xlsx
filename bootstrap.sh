#!/usr/bin/env bash
set -euo pipefail

REPO_URL="https://github.com/ItsOrv/xui-xlsx.git"
DEFAULT_INSTALL_DIR="${HOME}/xui-xlsx"
CALLER_DIR="$(pwd)"

if ! command -v git >/dev/null 2>&1; then
  echo "Error: git is required but not installed."
  exit 1
fi

if ! command -v python3 >/dev/null 2>&1; then
  echo "Error: python3 is required but not installed."
  exit 1
fi

INSTALL_DIR="${XUI_XLSX_DIR:-$DEFAULT_INSTALL_DIR}"

if [ -d "${INSTALL_DIR}/.git" ]; then
  echo "Updating existing repository at ${INSTALL_DIR}"
  git -C "${INSTALL_DIR}" fetch origin
  git -C "${INSTALL_DIR}" checkout main
  git -C "${INSTALL_DIR}" pull --ff-only origin main
else
  echo "Cloning repository into ${INSTALL_DIR}"
  rm -rf "${INSTALL_DIR}"
  git clone "${REPO_URL}" "${INSTALL_DIR}"
fi

cd "${INSTALL_DIR}"

echo "Setting up Python virtual environment"
python3 -m venv .venv
. .venv/bin/activate

echo "Installing dependencies"
python -m pip install --upgrade pip
python -m pip install -r requirements.txt

echo "Running exporter"
HAS_DB_ARGS=0
for arg in "$@"; do
  if [ "$arg" = "--db" ] || [ "$arg" = "--input-dir" ]; then
    HAS_DB_ARGS=1
    break
  fi
done

if [ "$HAS_DB_ARGS" -eq 1 ]; then
  python export_xui_users_to_excel.py "$@"
else
  python export_xui_users_to_excel.py --input-dir "${CALLER_DIR}" "$@"
fi

echo "Done."
echo "Outputs are in: ${INSTALL_DIR}"
