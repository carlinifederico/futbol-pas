#!/bin/sh
# Envuelve la página del armador en un documento HTML completo para GitHub Pages.
cd "$(dirname "$0")"
{ printf '<!doctype html><html lang="es"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover"><style>:root{padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px)}[hidden]{display:none!important}img{max-width:100%%}</style></head><body>\n'; cat ../nuevo-partido.html; printf '\n</body></html>\n'; } > index.html
