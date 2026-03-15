#!/bin/bash

# ============================================================
# Brain + Agent Architecture — Setup Script
# ============================================================
# This script copies the Brain and Agent architecture to your
# project and replaces placeholders with your project name.
# ============================================================

set -e

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color
BOLD='\033[1m'

echo ""
echo -e "${BLUE}${BOLD}🧠 Brain + Agent Architecture — Setup${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# Get script directory (where the template files are)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Step 1: Project Name
echo -e "${YELLOW}Step 1/3:${NC} What is your project name?"
echo -e "  (Use PascalCase or kebab-case, e.g., MyApp or my-app)"
read -p "  > " PROJECT_NAME

if [ -z "$PROJECT_NAME" ]; then
    echo -e "${RED}Error: Project name cannot be empty.${NC}"
    exit 1
fi

echo ""

# Step 2: Target Directory
echo -e "${YELLOW}Step 2/3:${NC} Where is your project root?"
echo -e "  (Absolute path, e.g., /Users/you/projects/my-app)"
echo -e "  Press Enter to use current directory: $(pwd)"
read -p "  > " TARGET_DIR

if [ -z "$TARGET_DIR" ]; then
    TARGET_DIR="$(pwd)"
fi

# Resolve to absolute path
TARGET_DIR="$(cd "$TARGET_DIR" 2>/dev/null && pwd)" || {
    echo -e "${RED}Error: Directory does not exist: $TARGET_DIR${NC}"
    exit 1
}

echo ""

# Step 3: Tech Stack
echo -e "${YELLOW}Step 3/4:${NC} What is your primary tech stack?"
echo -e "  (e.g., React/Node, Python/Django, Ruby on Rails)"
read -p "  > " TECH_STACK

if [ -z "$TECH_STACK" ]; then
    TECH_STACK="TBD"
fi

echo ""

# Step 4: Confirm
echo -e "${YELLOW}Step 4/4:${NC} Confirm setup:"
echo -e "  Project Name: ${GREEN}${PROJECT_NAME}${NC}"
echo -e "  Tech Stack:   ${GREEN}${TECH_STACK}${NC}"
echo -e "  Target:       ${GREEN}${TARGET_DIR}${NC}"
echo -e "  Will create:  ${GREEN}${TARGET_DIR}/Brain/${NC}"
echo -e "                ${GREEN}${TARGET_DIR}/.agents/rules/${NC}"
echo -e "                ${GREEN}${TARGET_DIR}/.agents/skills/${NC}"
echo -e "                ${GREEN}${TARGET_DIR}/.agents/workflows/${NC}"
echo ""

read -p "  Proceed? (y/N) " CONFIRM
if [[ ! "$CONFIRM" =~ ^[Yy]$ ]]; then
    echo -e "${YELLOW}Setup cancelled.${NC}"
    exit 0
fi

echo ""

# Check for existing directories
if [ -d "$TARGET_DIR/Brain" ]; then
    echo -e "${YELLOW}⚠️  Brain/ already exists at target. Overwrite? (y/N)${NC}"
    read -p "  > " OVERWRITE_BRAIN
    if [[ ! "$OVERWRITE_BRAIN" =~ ^[Yy]$ ]]; then
        echo "  Skipping Brain/ copy."
        SKIP_BRAIN=true
    fi
fi

if [ -d "$TARGET_DIR/.agents" ]; then
    echo -e "${YELLOW}⚠️  .agents/ already exists at target. Overwrite? (y/N)${NC}"
    read -p "  > " OVERWRITE_AGENT
    if [[ ! "$OVERWRITE_AGENT" =~ ^[Yy]$ ]]; then
        echo "  Skipping .agents/ copy."
        SKIP_AGENT=true
    fi
fi

echo ""
echo -e "${BLUE}Setting up...${NC}"

# Copy Brain
if [ "$SKIP_BRAIN" != true ]; then
    cp -r "$SCRIPT_DIR/Brain/" "$TARGET_DIR/Brain/"
    echo -e "  ${GREEN}✓${NC} Copied Brain/"
fi

# Copy .agents (rules + skills + workflows)
if [ "$SKIP_AGENT" != true ]; then
    cp -r "$SCRIPT_DIR/.agents/" "$TARGET_DIR/.agents/"
    echo -e "  ${GREEN}✓${NC} Copied .agents/rules/"
    echo -e "  ${GREEN}✓${NC} Copied .agents/skills/"
    echo -e "  ${GREEN}✓${NC} Copied .agents/workflows/ (includes post-execution-sync)"
fi

# Replace placeholders
echo -e "  ${BLUE}Replacing placeholders...${NC}"

if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    find "$TARGET_DIR/Brain/" "$TARGET_DIR/.agents/" \
        -name "*.md" -exec sed -i '' "s/{{PROJECT_NAME}}/$PROJECT_NAME/g" {} + 2>/dev/null || true
    find "$TARGET_DIR/Brain/" "$TARGET_DIR/.agents/" \
        -name "*.md" -exec sed -i '' "s/{{TECH_STACK}}/$TECH_STACK/g" {} + 2>/dev/null || true
else
    # Linux
    find "$TARGET_DIR/Brain/" "$TARGET_DIR/.agents/" \
        -name "*.md" -exec sed -i "s/{{PROJECT_NAME}}/$PROJECT_NAME/g" {} + 2>/dev/null || true
    find "$TARGET_DIR/Brain/" "$TARGET_DIR/.agents/" \
        -name "*.md" -exec sed -i "s/{{TECH_STACK}}/$TECH_STACK/g" {} + 2>/dev/null || true
fi

echo -e "  ${GREEN}✓${NC} Replaced {{PROJECT_NAME}} & {{TECH_STACK}}"

echo -e "  ${BLUE}Generating IDE Rules...${NC}"

RULES_CONTENT="You are an AI assistant bound by the rules defined in this workspace.
Before answering or taking any action, you MUST read and follow the instructions in:
- .agents/rules/universal-agent-rules.md
- .agents/rules/engineering-laws.md
- Brain/PROJECT_CORE.md"

echo "$RULES_CONTENT" > "$TARGET_DIR/.cursorrules"
echo "$RULES_CONTENT" > "$TARGET_DIR/.windsurfrules"
echo "$RULES_CONTENT" > "$TARGET_DIR/.clinerules"

echo -e "  ${GREEN}✓${NC} Created .cursorrules, .windsurfrules, .clinerules"

echo ""
echo -e "${GREEN}${BOLD}✅ Setup complete!${NC}"
echo ""
echo -e "${BLUE}${BOLD}Next steps:${NC}"
echo -e ""
echo -e "  ${YELLOW}1.${NC} Open Antigravity in your project and use one of these prompts:"
echo -e ""
echo -e "     ${BOLD}If the project is NEW (empty):${NC}"
echo -e "     > \"Initialize Brain — this is a new project. Act as a Tech Lead:"
echo -e "       ask me strategic questions to define scope, tech stack, and goals.\""
echo -e ""
echo -e "     ${BOLD}If the project ALREADY EXISTS:${NC}"
echo -e "     > \"Initialize Brain — this is an existing project. Deeply analyze"
echo -e "       the codebase and fill all Brain documents with the real architecture.\""
echo -e ""
echo -e "  ${YELLOW}2.${NC} The AI will guide you through the rest of the configuration."
echo -e ""
echo -e "  ${YELLOW}3.${NC} After setup, every complex task will auto-sync Brain docs via"
echo -e "     ${BOLD}.agents/workflows/post-execution-sync.md${NC}"
echo -e ""
echo -e "  📖 See ${BOLD}SETUP_GUIDE.md${NC} for manual configuration if needed."
echo -e "  🎨 See ${BOLD}CUSTOMIZATION.md${NC} for extending the architecture."
echo ""
