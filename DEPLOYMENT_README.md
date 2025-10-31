# Deployment Pipeline - Assignment

## Student Information
- **Name**: Saad Abdullah
- **Assignment**: CLO 4 - Deployment Pipeline using GitHub Actions
- **Project**: SCD Assignment 2 - GitHub Actions Workflows

---

## Assignment Requirement Met ✅

**Task**: Implement a deployment pipeline using GitHub Actions

**Requirements**:
1. ✅ Automates deployment process for web application
2. ✅ Defines stages: Build → Test → Deploy
3. ✅ Deploys to hosting platform (GitHub Pages, Heroku, AWS)
4. ✅ Secure and follows best practices for continuous delivery

---

## Implementation

### Workflow File: `.github/workflows/deploy.yml`

**Workflow Name**: Deployment Pipeline

**Trigger**: 
- Runs automatically on push to `main` branch
- Can be triggered manually with environment selection (staging/production)

**Stages**:

#### Stage 1: Build Application
1. **Checkout Repository** - Gets source code
2. **Setup Node.js** - Installs Node.js v20.x
3. **Check for package.json** - Validates project structure
4. **Install Dependencies** - Installs required packages
5. **Run Tests** - Validates functionality before deployment
6. **Build Application** - Creates production-ready files
7. **Create Artifacts** - Ensures deployment files exist
8. **Upload Artifacts** - Packages files for deployment

#### Stage 2: Deploy to Platform
1. **Download Artifacts** - Retrieves built files
2. **Deploy to Heroku** - (if HEROKU_API_KEY secret configured)
3. **Deploy to AWS** - (if AWS secrets configured)
4. **Deploy to GitHub Pages** - Automatic deployment
5. **Deployment Summary** - Shows deployment status and URL

---

## Security Best Practices ✅

### Secrets Management
- ✅ Uses GitHub Secrets for API keys
- ✅ No plaintext credentials in workflow files
- ✅ Environment-specific deployments
- ✅ Proper permission scopes

### Required Secrets (Optional)
For Heroku deployment:
- `HEROKU_API_KEY`
- `HEROKU_APP_NAME`

For AWS deployment:
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_REGION`

**Note**: Secrets are never exposed in logs or code!

---

## Deployment Platforms

### 1. GitHub Pages ✅
- **Automatic**: Deploys on every push to main
- **No Secrets Required**: Uses built-in GITHUB_TOKEN
- **URL Format**: `https://saad-abdulah.github.io/SCD_Assignment-2/`

### 2. Heroku (Optional)
- Requires HEROKU_API_KEY secret
- Deploys only if secret is configured
- Manual deployment commands available

### 3. AWS (Optional)
- Requires AWS credentials secrets
- Deploys only if secrets are configured
- Supports S3, CloudFront, etc.

---

## How to Interpret Results

### ✅ Success Indicators:
```
✅ DEPLOYMENT SUCCESSFUL!
🌐 Your website is live at:
https://saad-abdulah.github.io/SCD_Assignment-2/
```

**What this means**:
- All quality checks passed
- Build completed successfully
- Files deployed to GitHub Pages
- Website is now live and accessible

### ❌ Failure Indicators:

**If Build Fails**:
- Check linting or test errors
- Fix issues in code
- Push updated code

**If Deployment Fails**:
- Verify GitHub Pages is enabled (Settings → Pages → Source: GitHub Actions)
- Check permissions are correct
- Review deployment logs for specific errors

---

## Manual Deployment

To trigger deployment manually:

1. Go to **Actions** tab
2. Select **Deployment Pipeline** workflow
3. Click **Run workflow**
4. Select environment: **staging** or **production**
5. Click **Run workflow**

---

## Viewing Deployment Status

1. **Workflow Status**: Actions tab → Deployment Pipeline
2. **Live Website**: Visit the URL shown in success message
3. **Deployment Logs**: Click on workflow run → Deploy step
4. **Artifacts**: Download build artifacts from workflow run

---

## GitHub Pages Setup

**IMPORTANT**: Enable GitHub Pages before deployment works!

1. Go to: **Settings** → **Pages**
2. Under "Build and deployment"
3. Select **Source**: **GitHub Actions**
4. Click **Save**

See `ENABLE_PAGES_GUIDE.md` for detailed instructions.

---

## Assignment Completion ✅

✅ **Deployment pipeline implemented**  
✅ **Build → Test → Deploy stages defined**  
✅ **Multiple platform support (GitHub Pages, Heroku, AWS)**  
✅ **Secure secret management**  
✅ **Best practices followed**  
✅ **Manual and automatic triggers**

---

**Repository**: https://github.com/Saad-Abdulah/SCD_Assignment-2  
**Date**: January 2025

