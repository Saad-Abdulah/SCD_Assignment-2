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
4. **Deploy to Vercel** - Automatic deployment (requires Vercel secrets)
5. **Deployment Summary** - Shows deployment status and URL

---

## Security Best Practices ✅

### Secrets Management
- ✅ Uses GitHub Secrets for API keys
- ✅ No plaintext credentials in workflow files
- ✅ Environment-specific deployments
- ✅ Proper permission scopes

### Required Secrets

For Vercel deployment (Primary):
- `VERCEL_TOKEN` - Authentication token
- `VERCEL_ORG_ID` - Organization/Team ID
- `VERCEL_PROJECT_ID` - Project ID (optional but recommended)

For Heroku deployment (Optional):
- `HEROKU_API_KEY`
- `HEROKU_APP_NAME`

For AWS deployment (Optional):
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_REGION`

**Note**: Secrets are never exposed in logs or code!

**Setup**: See `VERCEL_DEPLOYMENT_GUIDE.md` for detailed instructions

---

## Deployment Platforms

### 1. Vercel ✅ (Primary)
- **Automatic**: Deploys on every push to main
- **Required Secrets**: VERCEL_TOKEN, VERCEL_ORG_ID, VERCEL_PROJECT_ID
- **URL Format**: `https://your-project.vercel.app`
- **See**: `VERCEL_DEPLOYMENT_GUIDE.md` for setup instructions

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
🌐 Your website is live on Vercel!
📦 Preview URL: https://your-project-xyz.vercel.app
🚀 Production URL: https://your-project.vercel.app
```

**What this means**:
- All quality checks passed
- Build completed successfully
- Files deployed to Vercel
- Website is now live and accessible

### ❌ Failure Indicators:

**If Build Fails**:
- Check linting or test errors
- Fix issues in code
- Push updated code

**If Deployment Fails**:
- Verify Vercel secrets are configured (Settings → Secrets → Actions)
- Check VERCEL_TOKEN, VERCEL_ORG_ID, and VERCEL_PROJECT_ID are set
- Review deployment logs for specific errors
- See `VERCEL_DEPLOYMENT_GUIDE.md` for troubleshooting

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

## Vercel Setup

**IMPORTANT**: Configure Vercel secrets before deployment works!

1. Go to: **Settings** → **Secrets and variables** → **Actions**
2. Add required secrets:
   - `VERCEL_TOKEN`
   - `VERCEL_ORG_ID`
   - `VERCEL_PROJECT_ID` (optional but recommended)
3. Save secrets

See `VERCEL_DEPLOYMENT_GUIDE.md` for detailed instructions.

---

## Assignment Completion ✅

✅ **Deployment pipeline implemented**  
✅ **Build → Test → Deploy stages defined**  
✅ **Multiple platform support (Vercel, Heroku, AWS)**  
✅ **Secure secret management**  
✅ **Best practices followed**  
✅ **Manual and automatic triggers**  
✅ **Vercel integration configured**

---

**Repository**: https://github.com/Saad-Abdulah/SCD_Assignment-2  
**Date**: January 2025

