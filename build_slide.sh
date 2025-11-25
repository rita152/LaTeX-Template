#!/usr/bin/env bash
set -euo pipefail

# 进入脚本所在目录，避免相对路径问题
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$PROJECT_DIR"

TEX_FILE="slide.tex"

if ! command -v latexmk >/dev/null 2>&1; then
  echo "Error: latexmk 未安装，请先安装后再执行此脚本。" >&2
  exit 1
fi

if [ ! -f "$TEX_FILE" ]; then
  echo "Error: 找不到 $TEX_FILE 文件。" >&2
  exit 1
fi

# 编译 tex，并在失败时立即退出
latexmk -xelatex -halt-on-error -interaction=nonstopmode "$TEX_FILE"

# 清理编译产生的中间文件，但保留最终的 PDF
latexmk -c "$TEX_FILE" >/dev/null 2>&1 || true
BASE_NAME="${TEX_FILE%.tex}"
rm -f "${BASE_NAME}".{nav,snm,toc,out,vrb,bbl,synctex.gz} "${BASE_NAME}".fdb_latexmk "${BASE_NAME}".fls
