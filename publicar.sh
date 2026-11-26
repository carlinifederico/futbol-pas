#!/bin/sh
# Publica Fútbol PAS en https://futbolpas.pages.dev (Cloudflare) y en GitHub Pages.
# Uso: sh publicar.sh "mensaje del cambio"
set -e
cd "$(dirname "$0")"
sh build.sh
cp ../figus/web/*.jpg figus/web/
git add -A
git commit -q -m "${1:-Actualización}

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>" || true
git push -q
T=$(mktemp -d); mkdir -p "$T/figus/web"; cp index.html "$T/"; cp figus/web/*.jpg "$T/figus/web/"
(cd "$T" && npx -y wrangler@3 pages deploy . --project-name futbolpas --branch main --commit-dirty=true | tail -2)
rm -rf "$T"
