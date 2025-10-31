# Vercel Deployment Guide

## Overview

This guide explains how to deploy your application to Vercel using GitHub Actions.

---

## Prerequisites

1. **Vercel Account**: Sign up at [vercel.com](https://vercel.com)
2. **Vercel Project**: Create a project in Vercel dashboard
3. **GitHub Secrets**: Configure required secrets (see below)

---

## Step 1: Get Vercel Credentials

### Option A: Using Vercel CLI (Recommended)

1. Install Vercel CLI:
   ```bash
   npm i -g vercel
   ```

2. Login to Vercel:
   ```bash
   vercel login
   ```

3. Link your project:
   ```bash
   vercel link
   ```
   This will create a `.vercel` folder with project information.

4. Get your credentials:
   - **ORG_ID**: Found in `.vercel/project.json` as `orgId`
   - **PROJECT_ID**: Found in `.vercel/project.json` as `projectId`
   - **TOKEN**: Create at [vercel.com/account/tokens](https://vercel.com/account/tokens)

### Option B: From Vercel Dashboard

1. Go to [vercel.com/dashboard](https://vercel.com/dashboard)
2. Select your project
3. Go to **Settings** → **General**
4. Find:
   - **Project ID**: Copy from project settings
   - **Team ID**: Your organization ID (if part of a team)
   - **Token**: Create at [vercel.com/account/tokens](https://vercel.com/account/tokens)

---

## Step 2: Configure GitHub Secrets

Add the following secrets to your GitHub repository:

1. Go to: **Settings** → **Secrets and variables** → **Actions**
2. Click **New repository secret**
3. Add these secrets:

### Required Secrets:

**VERCEL_TOKEN**
- Description: Vercel authentication token
- How to get: [vercel.com/account/tokens](https://vercel.com/account/tokens)
- Click "Create Token"
- Copy the token

**VERCEL_ORG_ID**
- Description: Your Vercel organization/team ID
- How to get: Check `.vercel/project.json` or Vercel dashboard → Settings → General

**VERCEL_PROJECT_ID** (Optional but recommended)
- Description: Your Vercel project ID
- How to get: Check `.vercel/project.json` or Vercel dashboard → Settings → General
- Note: If not provided, Vercel will auto-detect from the repository

---

## Step 3: Verify Workflow Configuration

The deployment workflow (`.github/workflows/deploy.yml`) includes a `deploy-vercel` job that:

1. Checks out your code
2. Sets up Node.js
3. Installs dependencies (if package.json exists)
4. Downloads build artifacts
5. Deploys to Vercel using `vercel/action@v1`

---

## Step 4: Deploy

### Automatic Deployment

Push to the `main` branch:
```bash
git add .
git commit -m "feat: deploy to Vercel"
git push origin main
```

The workflow will automatically:
- Build your application
- Deploy to Vercel
- Show deployment URLs in the workflow summary

### Manual Deployment

1. Go to **Actions** tab
2. Select **Deployment Pipeline**
3. Click **Run workflow**
4. Select environment: **staging** or **production**
5. Click **Run workflow**

---

## Viewing Deployment Results

After deployment:

1. **Check Workflow Status**:
   - Go to **Actions** tab
   - Find **Deployment Pipeline** workflow
   - Look for green checkmark ✅

2. **Find Deployment URLs**:
   - Expand the **Deploy to Vercel** step
   - View the workflow summary
   - URLs shown:
     - **Preview URL**: Preview deployment
     - **Production URL**: Production deployment

3. **Access Your Site**:
   - Visit the production URL
   - Vercel automatically assigns a domain like: `your-project.vercel.app`

---

## Custom Domain (Optional)

To use a custom domain:

1. Go to Vercel Dashboard → Your Project → Settings → Domains
2. Add your domain
3. Configure DNS as instructed
4. Vercel will automatically use it for deployments

---

## Environment Variables

If your project needs environment variables:

1. Go to Vercel Dashboard → Your Project → Settings → Environment Variables
2. Add variables for:
   - Production
   - Preview
   - Development

Or configure in `vercel.json`:
```json
{
  "env": {
    "MY_VAR": "value"
  }
}
```

---

## Vercel Configuration File

Create `vercel.json` in your project root for advanced configuration:

```json
{
  "version": 2,
  "builds": [
    {
      "src": "package.json",
      "use": "@vercel/node"
    }
  ],
  "routes": [
    {
      "src": "/(.*)",
      "dest": "/"
    }
  ]
}
```

See [Vercel Documentation](https://vercel.com/docs) for more options.

---

## Troubleshooting

### Issue: "VERCEL_TOKEN not found"

**Solution**: 
- Add `VERCEL_TOKEN` secret in GitHub Settings → Secrets → Actions
- Verify token is valid at [vercel.com/account/tokens](https://vercel.com/account/tokens)

### Issue: "VERCEL_ORG_ID not found"

**Solution**:
- Add `VERCEL_ORG_ID` secret
- Find it in `.vercel/project.json` or Vercel dashboard

### Issue: "Project not found"

**Solution**:
- Add `VERCEL_PROJECT_ID` secret
- Or link project first: `vercel link`
- Or create project in Vercel dashboard

### Issue: Deployment fails

**Possible Causes**:
1. Invalid credentials
2. Project not linked
3. Build errors
4. Missing dependencies

**Solution**:
1. Check workflow logs for specific errors
2. Verify all secrets are correct
3. Test build locally: `npm run build`
4. Check Vercel dashboard for project status

### Issue: Wrong files deployed

**Solution**:
- Configure `vercel.json` to specify build output directory
- Set `outputDirectory` in workflow if needed
- Check build artifacts are correct

---

## Workflow Configuration

The current workflow deploys:
- **Trigger**: Push to `main` branch
- **Build**: Creates artifacts in `dist/` or `build/`
- **Deploy**: Uses Vercel action to deploy
- **Environment**: Production (`--prod` flag)

To deploy to preview instead:
- Remove `vercel-args: '--prod'` from workflow
- Deployments will be preview deployments

---

## Best Practices

1. **Use Secrets**: Never commit tokens to repository
2. **Test Locally**: Build and test before deploying
3. **Monitor Deployments**: Check Vercel dashboard regularly
4. **Environment Variables**: Configure in Vercel dashboard
5. **Custom Domains**: Set up in Vercel settings

---

## Quick Reference

**Vercel Dashboard**: [vercel.com/dashboard](https://vercel.com/dashboard)  
**Create Token**: [vercel.com/account/tokens](https://vercel.com/account/tokens)  
**Documentation**: [vercel.com/docs](https://vercel.com/docs)  
**GitHub Secrets**: Settings → Secrets and variables → Actions

**Required Secrets**:
- `VERCEL_TOKEN` ✅ Required
- `VERCEL_ORG_ID` ✅ Required
- `VERCEL_PROJECT_ID` ⚠️ Optional (recommended)

---

## Next Steps

1. ✅ Configure GitHub secrets
2. ✅ Push code to trigger deployment
3. ✅ Check deployment URLs in workflow summary
4. ✅ Visit your live site on Vercel

---

**Repository**: https://github.com/Saad-Abdulah/SCD_Assignment-2  
**Vercel**: [vercel.com](https://vercel.com)

