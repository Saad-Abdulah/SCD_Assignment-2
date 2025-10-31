# Local Testing Guide

## Overview

This guide explains how to test workflows and scripts locally before pushing to GitHub.

---

## Prerequisites

- Node.js 18+ installed
- Git installed
- Terminal/Command line access

---

## Testing Workflow Scripts Locally

### 1. Check Deployment Readiness

Run the deployment readiness check:

```bash
./check-deployment-ready.sh
```

**What it checks**:
- ✅ Workflow files exist
- ✅ Required workflows present
- ✅ Documentation files exist
- ⚠️  Reminders for GitHub Pages setup

### 2. Test Deployment Process

Simulate the deployment process:

```bash
./deploy-test.sh
```

**What it tests**:
- ✅ Prerequisites check
- ✅ Dependency installation
- ✅ Linting (if configured)
- ✅ Tests (if configured)
- ✅ Build process
- ✅ Deployment file preparation

---

## Testing Individual Workflow Steps

### CI Workflow Steps

```bash
# Check for package.json
if [ -f "package.json" ]; then
    echo "✅ package.json exists"
fi

# Install dependencies
npm install

# Run linting
npm run lint

# Run tests
npm test

# Build project
npm run build
```

### Deployment Steps

```bash
# Check if build artifacts exist
if [ -d "dist" ] || [ -d "build" ]; then
    echo "✅ Build artifacts found"
else
    echo "⚠️  No build artifacts (workflow will create placeholder)"
fi
```

---

## Testing Without package.json

The workflows are designed to work even without a `package.json` file. They will:

1. Check for package.json existence
2. Skip npm-related steps if not found
3. Continue with other workflow steps
4. Create placeholder files if needed

**To test this**:
```bash
# Temporarily rename package.json
mv package.json package.json.backup

# Run deployment test
./deploy-test.sh

# Restore package.json
mv package.json.backup package.json
```

---

## Validating YAML Syntax

### Check Workflow Files

Use a YAML validator or GitHub Actions syntax checker:

```bash
# Install yamllint (if available)
yamllint .github/workflows/*.yml

# Or use online validator:
# https://github.com/schemaorg/schemaorg/tree/main/actions/validate-yaml
```

### Manual Review Checklist

- [ ] All workflow files use `.yml` extension
- [ ] Proper indentation (2 spaces)
- [ ] No syntax errors
- [ ] All required fields present
- [ ] Triggers configured correctly

---

## Testing Workflow Triggers

### Test Push Trigger

```bash
# Make a small change
echo "# Test" >> test.md

# Commit and push
git add test.md
git commit -m "test: trigger workflow"
git push origin main

# Check Actions tab for workflow run
```

### Test Manual Trigger

1. Go to **Actions** tab
2. Select workflow
3. Click **Run workflow**
4. Select branch
5. Click **Run workflow**

### Test PR Trigger

```bash
# Create a new branch
git checkout -b test-pr

# Make changes
echo "# PR Test" >> test.md
git add test.md
git commit -m "test: PR trigger"

# Push branch
git push origin test-pr

# Create PR on GitHub
# Check Actions tab for code-review workflow
```

---

## Testing Scheduled Workflows

Scheduled workflows can't be tested with actual schedule, but you can:

1. **Manual Trigger**:
   - Go to Actions tab
   - Select "Scheduled Tasks" workflow
   - Click "Run workflow"
   - Select branch and run

2. **Verify Cron Syntax**:
   - Use online cron validator
   - Test cron expression: `0 0 * * 0` (Sunday midnight UTC)

---

## Common Local Testing Scenarios

### Scenario 1: Testing CI Workflow

```bash
# 1. Make code changes
nano src/file.js

# 2. Run local checks
npm run lint
npm test
npm run build

# 3. Commit and push
git add .
git commit -m "feat: add feature"
git push origin main

# 4. Check Actions tab
```

### Scenario 2: Testing Deployment

```bash
# 1. Run deployment test script
./deploy-test.sh

# 2. Verify files exist
ls -la dist/  # or build/

# 3. Push to trigger deployment
git push origin main

# 4. Check deployment logs
# Go to Actions → Deployment Pipeline
```

### Scenario 3: Testing Code Review

```bash
# 1. Create feature branch
git checkout -b feature/new-feature

# 2. Make changes
nano src/file.js

# 3. Commit
git add .
git commit -m "feat: new feature"

# 4. Push branch
git push origin feature/new-feature

# 5. Create PR on GitHub
# 6. Check Actions tab for code-review workflow
```

---

## Debugging Tips

### Check Workflow Logs

1. Go to **Actions** tab
2. Click on workflow run
3. Expand failed step
4. Read error messages
5. Fix issues locally
6. Push again

### Common Issues

**Issue**: Workflow not triggering
- Check workflow file is in `.github/workflows/`
- Verify YAML syntax is correct
- Check trigger conditions match

**Issue**: Steps failing
- Read error messages in logs
- Test commands locally
- Check for missing dependencies

**Issue**: Permissions errors
- Verify workflow permissions
- Check GitHub Pages is enabled
- Review repository settings

---

## Best Practices

1. **Test Locally First**:
   - Run scripts before pushing
   - Check YAML syntax
   - Validate file structure

2. **Use Test Branches**:
   - Create test branches for experimentation
   - Don't test on main branch directly

3. **Check Logs**:
   - Always review workflow logs
   - Look for warnings
   - Fix issues before merging

4. **Document Changes**:
   - Update documentation when workflows change
   - Keep README files current

---

## Quick Reference

**Test Scripts**:
- `./check-deployment-ready.sh` - Check deployment readiness
- `./deploy-test.sh` - Test deployment process

**Manual Commands**:
- `npm run lint` - Run linting
- `npm test` - Run tests
- `npm run build` - Build project
- `npm run ci` - Run all CI checks

**GitHub Actions**:
- Actions tab: View workflow runs
- Settings → Pages: Configure GitHub Pages
- Settings → Actions: Configure workflow permissions

---

**Repository**: https://github.com/Saad-Abdulah/SCD_Assignment-2

