#!/bin/bash

# Deployment Test Script
# This script simulates deployment steps locally for testing

echo "🧪 Testing deployment process..."
echo ""

# Step 1: Check prerequisites
echo "Step 1: Checking prerequisites..."
if [ -f "package.json" ]; then
    echo "✅ package.json found"
    
    # Check if node_modules exists
    if [ -d "node_modules" ]; then
        echo "✅ Dependencies installed"
    else
        echo "⚠️  Installing dependencies..."
        npm install
    fi
else
    echo "⚠️  No package.json found (workflow will handle this)"
fi

# Step 2: Run linting (if configured)
echo ""
echo "Step 2: Running linting..."
if [ -f "package.json" ] && grep -q "\"lint\"" package.json; then
    npm run lint || echo "⚠️  Linting failed or not configured"
else
    echo "⚠️  Linting not configured"
fi

# Step 3: Run tests (if configured)
echo ""
echo "Step 3: Running tests..."
if [ -f "package.json" ] && grep -q "\"test\"" package.json; then
    npm test || echo "⚠️  Tests failed or not configured"
else
    echo "⚠️  Tests not configured"
fi

# Step 4: Build (if configured)
echo ""
echo "Step 4: Building project..."
if [ -f "package.json" ] && grep -q "\"build\"" package.json; then
    npm run build || echo "⚠️  Build failed or not configured"
else
    echo "⚠️  Build not configured"
fi

# Step 5: Check for deployment files
echo ""
echo "Step 5: Checking deployment files..."
if [ -d "dist" ]; then
    echo "✅ dist/ directory found"
    FILE_COUNT=$(find dist -type f | wc -l)
    echo "   Found $FILE_COUNT file(s)"
elif [ -d "build" ]; then
    echo "✅ build/ directory found"
    FILE_COUNT=$(find build -type f | wc -l)
    echo "   Found $FILE_COUNT file(s)"
else
    echo "⚠️  No dist/ or build/ directory found"
    echo "   Workflow will create placeholder files"
fi

# Step 6: Verify workflow files
echo ""
echo "Step 6: Verifying workflow files..."
if [ -f ".github/workflows/deploy.yml" ]; then
    echo "✅ deploy.yml workflow found"
else
    echo "❌ deploy.yml workflow not found"
fi

echo ""
echo "✅ Deployment test complete!"
echo ""
echo "Note: This is a local simulation. Actual deployment happens via GitHub Actions."
echo "Push your code to trigger the real deployment workflow."

