#!/bin/bash

# Check Deployment Readiness Script
# This script checks if the repository is ready for deployment

echo "🔍 Checking deployment readiness..."
echo ""

# Check if package.json exists
if [ -f "package.json" ]; then
    echo "✅ package.json found"
else
    echo "⚠️  package.json not found (workflows will handle this gracefully)"
fi

# Check if .github/workflows directory exists
if [ -d ".github/workflows" ]; then
    echo "✅ Workflows directory exists"
    WORKFLOW_COUNT=$(ls -1 .github/workflows/*.yml 2>/dev/null | wc -l)
    echo "   Found $WORKFLOW_COUNT workflow file(s)"
else
    echo "❌ .github/workflows directory not found"
    exit 1
fi

# Check for required workflow files
REQUIRED_WORKFLOWS=("ci.yml" "deploy.yml" "scheduled-tasks.yml" "dependency-updates.yml" "code-review.yml" "documentation.yml" "custom-workflow.yml")

echo ""
echo "📋 Checking required workflows:"
for workflow in "${REQUIRED_WORKFLOWS[@]}"; do
    if [ -f ".github/workflows/$workflow" ]; then
        echo "✅ $workflow"
    else
        echo "❌ $workflow - MISSING"
    fi
done

# Check if GitHub Pages is configured (can't check remotely, just remind)
echo ""
echo "📝 Reminders:"
echo "   - Enable GitHub Pages: Settings → Pages → Source: GitHub Actions"
echo "   - See ENABLE_PAGES_GUIDE.md for instructions"

# Check for documentation files
echo ""
echo "📚 Checking documentation:"
if [ -f "WORKFLOW_DOCUMENTATION.md" ]; then
    echo "✅ WORKFLOW_DOCUMENTATION.md"
else
    echo "⚠️  WORKFLOW_DOCUMENTATION.md not found"
fi

DOC_FILES=("CI_README.md" "DEPLOYMENT_README.md" "CODE_REVIEW_README.md" "SCHEDULED_TASKS_README.md" "ENABLE_PAGES_GUIDE.md")
for doc in "${DOC_FILES[@]}"; do
    if [ -f "$doc" ]; then
        echo "✅ $doc"
    else
        echo "⚠️  $doc not found"
    fi
done

echo ""
echo "✅ Deployment readiness check complete!"
echo ""
echo "Next steps:"
echo "1. Enable GitHub Pages (see ENABLE_PAGES_GUIDE.md)"
echo "2. Push code to trigger workflows"
echo "3. Check Actions tab for workflow runs"

