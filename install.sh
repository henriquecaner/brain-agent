#!/bin/bash

# ============================================================
# Brain + Agent Architecture — Install Script
# ============================================================
# Copies .specs/ and .agents/ to the current directory.
# Non-interactive. Safe to pipe from curl.
#
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/henriquecaner/brain-agent/main/install.sh | bash
# ============================================================

set -e

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'
BOLD='\033[1m'

TARGET_DIR="$(pwd)"
REPO_URL="https://github.com/henriquecaner/brain-agent.git"
TMP_DIR=$(mktemp -d)

# Cleanup on exit
cleanup() {
    rm -rf "$TMP_DIR"
}
trap cleanup EXIT

echo ""
echo -e "${BLUE}${BOLD}🧠 Brain + Agent Architecture — Install${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo -e "  Installing to: ${GREEN}${TARGET_DIR}${NC}"
echo ""

# ── Guard: Don't install into the template repo itself ──
if [ -f "$TARGET_DIR/install.sh" ] && [ -f "$TARGET_DIR/CUSTOMIZATION.md" ] && [ -f "$TARGET_DIR/CONTRIBUTING.md" ]; then
    echo -e "${RED}${BOLD}❌ ERROR: This looks like the brain-agent template repo itself.${NC}"
    echo -e "${RED}   Run this from YOUR PROJECT root instead.${NC}"
    echo ""
    exit 1
fi

# ── Check for existing directories ──
EXISTING=""
if [ -d "$TARGET_DIR/.specs" ]; then
    EXISTING="${EXISTING} .specs/"
fi
if [ -d "$TARGET_DIR/.agents" ]; then
    EXISTING="${EXISTING} .agents/"
fi

if [ -n "$EXISTING" ]; then
    echo -e "${YELLOW}⚠️  Already exists:${EXISTING}${NC}"
    echo -e "${YELLOW}   Remove them first if you want a fresh install.${NC}"
    echo -e "${YELLOW}   Aborting to avoid overwriting your data.${NC}"
    echo ""
    exit 1
fi

# ── Clone and copy ──
echo -e "  ${BLUE}Downloading...${NC}"
git clone --quiet --depth 1 "$REPO_URL" "$TMP_DIR" 2>/dev/null

echo -e "  ${BLUE}Installing...${NC}"
cp -r "$TMP_DIR/.specs/" "$TARGET_DIR/.specs/"
cp -r "$TMP_DIR/.agents/" "$TARGET_DIR/.agents/"

# Clean up install artifacts that shouldn't be in user projects
rm -f "$TARGET_DIR/.agents/.skill-lock.json"
rm -f "$TARGET_DIR/.agents/.skill-lock.json.backup"

echo -e "  ${GREEN}✓${NC} Created .specs/project/ (5 templates)"
echo -e "  ${GREEN}✓${NC} Created .agents/rules/"
echo -e "  ${GREEN}✓${NC} Created .agents/skills/"
echo -e "  ${GREEN}✓${NC} Created .agents/workflows/"

echo ""
echo -e "${GREEN}${BOLD}✅ Installed!${NC}"
echo ""
echo -e "${BLUE}${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${YELLOW}${BOLD}⚠️  NEXT STEP: Open Antigravity in this project${NC}"
echo -e "${BLUE}${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo -e "  Paste ${BOLD}ONE${NC} of these prompts ${RED}${BOLD}inside Antigravity${NC} (not here!):"
echo ""
echo -e "  ${BOLD}Path A — Existing project:${NC}"
echo -e "  ${GREEN}\"Map codebase — this is an existing project. Deeply analyze${NC}"
echo -e "  ${GREEN}the codebase and fill all .specs/ documents with the real${NC}"
echo -e "  ${GREEN}architecture, stack, and patterns.\"${NC}"
echo ""
echo -e "  ${BOLD}Path B — New project:${NC}"
echo -e "  ${GREEN}\"Initialize project — this is a new project. Act as a Tech Lead:${NC}"
echo -e "  ${GREEN}ask me strategic questions to define scope, tech stack, and${NC}"
echo -e "  ${GREEN}goals before scaffolding anything.\"${NC}"
echo ""
echo -e "  📖 Full docs: ${BOLD}https://github.com/henriquecaner/brain-agent${NC}"
echo ""
