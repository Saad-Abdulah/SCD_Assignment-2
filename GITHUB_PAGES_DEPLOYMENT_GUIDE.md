# GitHub Pages Deployment Guide

## Overview

This guide explains how the GitHub Pages deployment works in this repository and how to troubleshoot common issues.

---

## How It Works

### Deployment Pipeline Workflow

The `deploy.yml` workflow automatically deploys your site to GitHub Pages when:

1. Code is pushed to the `main` branch
2. Manual workflow dispatch is triggered

### Deployment Process

1. **Build Stage**:
   - Checks out code
   - Sets up Node.js environment
   - Installs dependencies (if package.json exists)
   - Runs tests and linting
   - Builds the application
   - Creates build artifacts

2. **Deploy Stage**:
   - Downloads build artifacts
   - Prepares deployment directory
   - Uploads files to GitHub Pages
   - Publishes the site

3. **Result**:
   - Website is live at: `https://saad-abdulah.github.io/SCD_Assignment-2/`

---

## Prerequisites

### 1. Enable GitHub Pages

**REQUIRED**: Before deployment will work, you must enable GitHub Pages:

1. Go to: **Settings** → **Pages**
2. Under "Build and deployment"
3. Select **Source**: **GitHub Actions**
4. Click **Save**

See `ENABLE_PAGES_GUIDE.md` for detailed instructions.

### 2. Workflow Permissions

The workflow requires these permissions:
- `contents: read` - Read repository code
- `pages: write` - Deploy to GitHub Pages
- `id-token: write` - Authentication

These are automatically configured in the workflow file.

---

## Deployment Files

### Where Files Are Deployed From

The workflow looks for files in these locations (in order):

1. `dist/` directory (if exists)
2. `build/` directory (if exists)
3. Created placeholder files (if neither exists)

### File Structure

```
dist/          or    build/
├── index.html
├── css/
├── js/
└── ...
```

---

## Viewing Your Deployed Site

After a successful deployment:

1. **Check Workflow Status**:
   - Go to **Actions** tab
   - Find **Deployment Pipeline** workflow
   - Look for green checkmark ✅

2. **Find Your URL**:
   - The URL is shown in the workflow logs
   - Format: `https://saad-abdulah.github.io/SCD_Assignment-2/`

3. **Access Your Site**:
   - Visit the URL in your browser
   - Wait 1-2 minutes after deployment for site to be live

---

## Troubleshooting

### Issue: Workflow Fails with "Permission Denied"

**Cause**: GitHub Pages not enabled or wrong source

**Solution**:
1. Go to Settings → Pages
2. Verify Source is set to "GitHub Actions"
3. Save settings
4. Re-run workflow

### Issue: "Resource not accessible by integration"

**Cause**: GitHub Pages not enabled

**Solution**: Follow `ENABLE_PAGES_GUIDE.md` instructions

### Issue: Workflow Succeeds but Site Shows 404

**Possible Causes**:
1. Files not in correct location
2. No index.html file
3. Site still building (wait 1-2 minutes)

**Solution**:
1. Check workflow logs for file paths
2. Verify files are being uploaded
3. Wait a few minutes and refresh

### Issue: Site Shows Old Content

**Cause**: GitHub Pages cache

**Solution**:
1. Wait 5-10 minutes for cache to clear
2. Hard refresh browser (Ctrl+F5 or Cmd+Shift+R)
3. Check deployment logs for latest commit

---

## Manual Deployment

To manually trigger deployment:

1. Go to **Actions** tab
2. Select **Deployment Pipeline**
3. Click **Run workflow**
4. Select branch: **main**
5. Click **Run workflow**

---

## Custom Domain (Optional)

To use a custom domain:

1. Create `CNAME` file in your repository root:
   ```
   yourdomain.com
   ```

2. Configure DNS:
   - Add CNAME record pointing to `saad-abdulah.github.io`

3. Update workflow:
   - Add CNAME file to deployment directory

---

## Deployment History

View deployment history:

1. Go to **Settings** → **Pages**
2. Scroll to "Deployment history"
3. See all deployments with timestamps

---

## Best Practices

### 1. Test Locally First
```bash
# Run deployment test script
./deploy-test.sh
```

### 2. Check Workflow Logs
- Always review deployment logs
- Look for warnings or errors
- Verify files are uploaded correctly

### 3. Monitor Deployments
- Check Actions tab regularly
- Set up email notifications for failures
- Review deployment status badges

---

## Additional Resources

- [GitHub Pages Documentation](https://docs.github.com/en/pages)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Workflow Syntax](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions)

---

## Quick Reference

**Deployment URL**: `https://saad-abdulah.github.io/SCD_Assignment-2/`  
**Workflow File**: `.github/workflows/deploy.yml`  
**Settings**: Settings → Pages → Source: GitHub Actions  
**Status**: Check Actions tab for deployment status

---

**Repository**: https://github.com/Saad-Abdulah/SCD_Assignment-2

