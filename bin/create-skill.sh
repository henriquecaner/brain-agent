#!/bin/bash

# ============================================================
# Brain + Agent Architecture — Create Skill utility
# ============================================================
# Quickly scaffold a new AI skill directory and template.
# ============================================================

set -e

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color
BOLD='\033[1m'

echo -e "${BLUE}${BOLD}🤖 Create New Agent Skill${NC}"

# 1. Get arguments
if [ -z "$1" ]; then
    read -p "  Enter skill name (e.g., database-design): " SKILL_NAME
else
    SKILL_NAME=$1
fi

if [ -z "$SKILL_NAME" ]; then
    echo -e "${RED}Error: Skill name is required.${NC}"
    exit 1
fi

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILL_DIR="$PROJECT_ROOT/.agents/skills/$SKILL_NAME"

# 2. Check if skill exists
if [ -d "$SKILL_DIR" ]; then
    echo -e "${RED}Error: Skill '$SKILL_NAME' already exists at $SKILL_DIR${NC}"
    exit 1
fi

# 3. Create from template
mkdir -p "$SKILL_DIR"
cp "$PROJECT_ROOT/.agents/skills/_template/SKILL.md" "$SKILL_DIR/SKILL.md"

# 4. Replace placeholder
if [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i '' "s/skill-name-template/$SKILL_NAME/g" "$SKILL_DIR/SKILL.md"
else
    sed -i "s/skill-name-template/$SKILL_NAME/g" "$SKILL_DIR/SKILL.md"
fi

echo -e "  ${GREEN}✓${NC} Created skill at .agents/skills/$SKILL_NAME/SKILL.md"

# 5. Append to universal rules (best effort)
RULES_FILE="$PROJECT_ROOT/.agents/rules/universal-agent-rules.md"
if [ -f "$RULES_FILE" ]; then
    echo -e "  ${YELLOW}i${NC} Remember to register this skill in .agents/rules/universal-agent-rules.md:"
    echo -e "    | **$SKILL_NAME** | \`.agents/skills/$SKILL_NAME/SKILL.md\` | [Description] |"
fi

echo -e "\n${GREEN}${BOLD}✅ Skill scaffolded successfully!${NC}"
