#!/usr/bin/env bash
# Image compression for web using ImageMagick 7
# Usage: compress.sh <input> [output] [--quality N] [--max-width N] [--format FORMAT]
#   input:       file path or directory (batch mode)
#   output:      output file or directory (default: <name>-compressed.<ext> / compressed/)
#   --quality:   1-100, default 80 (ignored for PNG which uses lossless compression)
#   --max-width: downscale to this width if larger, preserving aspect ratio
#   --format:    force output format (jpeg|png|webp|gif). Default: keep original.
set -euo pipefail

QUALITY=80
MAX_WIDTH=""
FORMAT=""
INPUT=""
OUTPUT=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --quality)  QUALITY="$2"; shift 2 ;;
    --max-width) MAX_WIDTH="$2"; shift 2 ;;
    --format)   FORMAT="$(echo "$2" | tr '[:upper:]' '[:lower:]')"; shift 2 ;;
    -*)         echo "Unknown option: $1" >&2; exit 1 ;;
    *)
      if [[ -z "$INPUT" ]]; then INPUT="$1"
      elif [[ -z "$OUTPUT" ]]; then OUTPUT="$1"
      else echo "Unexpected argument: $1" >&2; exit 1
      fi
      shift ;;
  esac
done

if [[ -z "$INPUT" ]]; then
  echo "Usage: compress.sh <input> [output] [--quality N] [--max-width N] [--format FORMAT]"
  exit 1
fi

# Resolve output extension from format flag
ext_for_format() {
  case "$1" in
    jpeg|jpg) echo "jpg" ;;
    png)      echo "png" ;;
    webp)     echo "webp" ;;
    gif)      echo "gif" ;;
    *)        echo "$1" ;;
  esac
}

compress_file() {
  local src="$1"
  local dst="$2"

  # Determine output extension
  local src_ext="${src##*.}"
  src_ext="$(echo "$src_ext" | tr '[:upper:]' '[:lower:]')"
  local out_ext="$src_ext"
  if [[ -n "$FORMAT" ]]; then
    out_ext="$(ext_for_format "$FORMAT")"
  fi

  # If dst is empty, generate default name
  if [[ -z "$dst" ]]; then
    local base="${src%.*}"
    dst="${base}-compressed.${out_ext}"
  fi

  # Build magick args as a proper array (avoids eval and shell interpretation issues)
  local args=()

  # Resize if requested
  if [[ -n "$MAX_WIDTH" ]]; then
    args+=("-resize" "${MAX_WIDTH}x>")
  fi

  # Strip metadata (EXIF, ICC profiles add bloat)
  args+=("-strip")

  case "$out_ext" in
    jpg|jpeg)
      args+=("-quality" "$QUALITY")
      args+=("-sampling-factor" "4:2:0")
      args+=("-interlace" "JPEG")
      ;;
    png)
      # PNG is lossless; optimize with maximum compression + adaptive filtering
      args+=("-define" "png:compression-level=9")
      args+=("-define" "png:compression-filter=5")
      args+=("-define" "png:compression-strategy=1")
      # Reduce to 8-bit if source is 16-bit (saves ~50%)
      args+=("-depth" "8")
      ;;
    webp)
      args+=("-quality" "$QUALITY")
      args+=("-define" "webp:method=6")
      args+=("-define" "webp:auto-filter=true")
      ;;
    gif)
      args+=("-layers" "optimize")
      args+=("-fuzz" "2%")
      ;;
  esac

  local src_size
  src_size=$(stat -f%z "$src" 2>/dev/null || stat -c%s "$src" 2>/dev/null)

  # Run magick with proper array expansion (no eval needed)
  magick "$src" "${args[@]}" "$dst"

  local dst_size
  dst_size=$(stat -f%z "$dst" 2>/dev/null || stat -c%s "$dst" 2>/dev/null)

  local pct=0
  if [[ "$src_size" -gt 0 ]]; then
    pct=$(( (src_size - dst_size) * 100 / src_size ))
  fi

  printf "  %-40s %6sK → %6sK  (%d%% reduction)\n" \
    "$(basename "$dst")" \
    "$(( src_size / 1024 ))" \
    "$(( dst_size / 1024 ))" \
    "$pct"
}

# --- Main ---
if [[ -d "$INPUT" ]]; then
  # Batch mode
  OUT_DIR="${OUTPUT:-${INPUT}/compressed}"
  mkdir -p "$OUT_DIR"
  echo "Compressing images in: $INPUT → $OUT_DIR"
  echo ""

  shopt -s nullglob nocaseglob
  files=("$INPUT"/*.{jpg,jpeg,png,webp,gif})
  shopt -u nullglob nocaseglob

  if [[ ${#files[@]} -eq 0 ]]; then
    echo "No supported images found (jpg, jpeg, png, webp, gif)."
    exit 0
  fi

  for f in "${files[@]}"; do
    local_ext="${f##*.}"
    local_ext="$(echo "$local_ext" | tr '[:upper:]' '[:lower:]')"
    out_ext="$local_ext"
    if [[ -n "$FORMAT" ]]; then
      out_ext="$(ext_for_format "$FORMAT")"
    fi
    base="$(basename "${f%.*}")"
    compress_file "$f" "${OUT_DIR}/${base}.${out_ext}"
  done

  echo ""
  echo "Done. Compressed images saved to: $OUT_DIR"
else
  # Single file
  echo "Compressing: $INPUT"
  echo ""
  compress_file "$INPUT" "$OUTPUT"
  echo ""
  echo "Done."
fi
