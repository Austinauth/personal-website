---
name: image-compress
description: Compress and optimize images for the web using ImageMagick, preserving visual quality while minimizing file size. Use when a user wants to compress, optimize, or reduce the size of images (JPEG, PNG, WebP, GIF), convert images to web-friendly formats, batch-compress a directory of images, or make images web-ready. Triggers on requests mentioning image compression, optimization, file size reduction, or web-ready images.
---

# Image Compress

Compress images for web delivery using ImageMagick 7 (`magick` CLI). Supports JPEG, PNG, WebP, and GIF.

## Quick Start

Run `scripts/compress.sh` from this skill's directory:

```bash
# Single file — keeps original format
scripts/compress.sh photo.jpg

# Convert to WebP (best web format — typically 25-35% smaller than JPEG)
scripts/compress.sh photo.png --format webp

# Batch compress entire directory
scripts/compress.sh ./images/

# Full options
scripts/compress.sh photo.png output.webp --quality 75 --max-width 1200
```

## Script Options

| Flag | Default | Description |
|------|---------|-------------|
| `--quality N` | 80 | 1-100. Applies to JPEG/WebP. Ignored for PNG (lossless). |
| `--max-width N` | none | Downscale to N pixels wide if larger. Preserves aspect ratio. |
| `--format F` | same | Force output format: `jpeg`, `png`, `webp`, `gif`. |

Output naming: `<name>-compressed.<ext>` for single files, `compressed/` subdirectory for batch.

## Format Selection Guide

Choose output format based on content:

- **WebP** — Best default for web. Lossy with excellent quality-to-size ratio. ~25-35% smaller than equivalent JPEG.
- **JPEG** — Photographs, complex scenes. Use quality 75-85.
- **PNG** — Screenshots, text, UI elements, transparency needed. Lossless only — compression is structural, not quality-based.
- **GIF** — Simple animations only. For static images, prefer any other format.

When the user doesn't specify a format, suggest WebP for maximum compression or keep the original format if compatibility is a concern.

## Quality Guidelines

| Scenario | Quality | Notes |
|----------|---------|-------|
| Hero/banner images | 85-90 | Visible, large — quality matters |
| Thumbnails/cards | 70-80 | Small display size hides artifacts |
| Background images | 60-75 | Often blurred or overlaid |
| General web use | 80 | Good default balance |

## When to Adjust the Script

The bundled script covers standard compression. For advanced cases, use `magick` directly:

- **Lossy PNG** (via pngquant): `pngquant --quality=65-80 image.png`
- **Conditional resize by height**: `magick input.jpg -resize x800> output.jpg`
- **Specific crop + compress**: `magick input.jpg -crop 800x600+0+0 -quality 80 output.jpg`
- **Progressive JPEG already handled** by the script via `-interlace JPEG`

## What the Script Does Internally

Per format, the script applies these ImageMagick optimizations:

- **All formats**: `-strip` (removes EXIF/metadata bloat)
- **JPEG**: `-quality N -sampling-factor 4:2:0 -interlace JPEG` (chroma subsampling + progressive loading)
- **PNG**: max compression level 9, adaptive filtering, 8-bit depth reduction
- **WebP**: `-quality N -define webp:method=6 -define webp:auto-filter=true` (slowest/best compression)
- **GIF**: `-layers optimize -fuzz 2%` (frame deduplication)
