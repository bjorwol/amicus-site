#!/usr/bin/env bash
# Upload the site to the CS 147 AFS webspace.
# Usage: ./deploy.sh <your-sunet-id>
# Fill in STUDIO and PROJECT once the course staff confirms your folder names.

set -euo pipefail

STUDIO="DesignforOfflineExperiences"
PROJECT="amicus"
SUNET="${1:?Usage: ./deploy.sh <sunet-id>}"

DEST="/afs/ir/class/cs147/WWW/projects/${STUDIO}/${PROJECT}/"

rsync -avz --delete \
  --exclude ".git" --exclude ".gitignore" --exclude ".DS_Store" \
  --exclude "README.md" --exclude "CLAUDE.md" --exclude "deploy.sh" \
  ./ "${SUNET}@rice.stanford.edu:${DEST}"

echo ""
echo "Deployed. Check: http://web.stanford.edu/class/cs147/projects/${STUDIO}/${PROJECT}/"
