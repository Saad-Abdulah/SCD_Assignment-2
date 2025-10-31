# GitHub Actions Workflows Documentation

This document provides a comprehensive explanation of all 7 GitHub Actions workflows configured in this repository.

## Table of Contents

1. [Continuous Integration (ci.yml)](#1-continuous-integration-ciyml)
2. [Deployment Pipeline (deploy.yml)](#2-deployment-pipeline-deployyml)
3. [Scheduled Tasks (scheduled-tasks.yml)](#3-scheduled-tasks-scheduled-tasksyml)
4. [Dependency Updates (dependency-updates.yml)](#4-dependency-updates-dependency-updatesyml)
5. [Code Review (code-review.yml)](#5-code-review-code-reviewyml)
6. [Documentation Deployment (documentation.yml)](#6-documentation-deployment-documentationyml)
7. [Custom Workflow (custom-workflow.yml)](#7-custom-workflow-custom-workflowyml)

---

## 1. Continuous Integration (ci.yml)

### Purpose
Automates testing, linting, and build verification on every push to the main branch and pull requests.

### Trigger Type
- **Push events**: Triggers on pushes to `main` branch
- **Pull request events**: Triggers on PRs targeting `main` branch

### Key Jobs/Steps

1. **Test Job**
   - Matrix strategy testing across Node.js versions (18.x, 20.x)
   - Checks out code
   - Sets up Node.js environment
   - Installs dependencies using `npm ci`
   - Runs linter (if configured)
   - Executes test suite
   - Builds the project
   - Uploads test results and coverage as artifacts
   - Generates test report summary

### Output/Result Interpretation

- **Success**: All tests pass, linting passes, and build succeeds
- **Failure**: Any step fails (tests fail, linting errors, build errors)
- **Artifacts**: Test results and coverage reports are saved for download
- **Summary**: Test results are displayed in GitHub Actions summary

### Benefits
- Ensures code quality before merging
- Catches bugs early in the development cycle
- Provides test coverage reports
- Supports multiple Node.js versions for compatibility testing

---

## 2. Deployment Pipeline (deploy.yml)

### Purpose
Automates the deployment process to various hosting platforms (Heroku, AWS, GitHub Pages) with secure credential management.

### Trigger Type
- **Push events**: Automatic deployment on pushes to `main` branch
- **Workflow dispatch**: Manual triggering with environment selection (staging/production)

### Key Jobs/Steps

1. **Build Job**
   - Checks out code
   - Sets up Node.js environment
   - Installs dependencies
   - Runs tests (validation step)
   - Builds the application
   - Uploads build artifacts

2. **Deploy Job** (depends on build)
   - Downloads build artifacts
   - Deploys to selected platform:
     - **Heroku**: Uses `HEROKU_API_KEY` secret
     - **AWS**: Uses `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` secrets
     - **GitHub Pages**: Automatic deployment
   - Generates deployment summary

### Output/Result Interpretation

- **Success**: Application successfully built and deployed to target environment
- **Failure**: Build or deployment step fails
- **Secrets**: Platform credentials stored securely in GitHub Secrets (never exposed)
- **Summary**: Deployment status, environment, and commit hash displayed

### Security Compliance
- ✅ Uses GitHub Secrets for API keys and tokens
- ✅ No plaintext credentials in workflow files
- ✅ Environment-specific deployments with proper permissions

### Benefits
- Automated deployments reduce manual errors
- Consistent deployment process
- Multiple platform support
- Environment selection for controlled releases

---

## 3. Scheduled Tasks (scheduled-tasks.yml)

### Purpose
Automates weekly maintenance tasks including cleanup, backups, and dependency audits.

### Trigger Type
- **Schedule**: Runs every Sunday at midnight UTC (`0 0 * * 0`)
- **Workflow dispatch**: Manual triggering available

### Key Jobs/Steps

1. **Maintenance Job**
   - Checks out code
   - Sets up Node.js environment
   - Cleans up old artifacts (logs older than 7 days)
   - Simulates database backup (creates backup log)
   - Runs dependency audit
   - Checks for outdated packages
   - Generates maintenance report
   - Uploads maintenance logs as artifacts

### Output/Result Interpretation

- **Success**: All maintenance tasks completed successfully
- **Logs**: Maintenance logs saved as artifacts (retained for 30 days)
- **Summary**: Weekly maintenance report with timestamp and task status

### Benefits
- Automated cleanup prevents disk space issues
- Regular dependency audits ensure security
- Backup logs provide audit trail
- Scheduled maintenance without manual intervention

---

## 4. Dependency Updates (dependency-updates.yml)

### Purpose
Automatically checks for outdated dependencies and creates pull requests for updates.

### Trigger Type
- **Schedule**: Runs every Monday at 9 AM UTC (`0 9 * * 1`)
- **Workflow dispatch**: Manual triggering available

### Key Jobs/Steps

1. **Check Updates Job**
   - Checks out code
   - Sets up Node.js environment
   - Installs dependencies
   - Checks for outdated packages using `npm outdated`
   - Runs security audit using `npm audit`
   - Tests with updated dependencies (if updates found)
   - Generates update report
   - Uploads dependency reports as artifacts

2. **Create PR Job** (if updates found)
   - Creates new branch for updates
   - Updates dependencies
   - Creates pull request with update details
   - Uses GitHub Actions bot for commits

### Output/Result Interpretation

- **Success**: Dependency check completed, PR created if updates available
- **Artifacts**: Outdated packages list and audit reports (retained for 7 days)
- **PR**: Automatic pull request created for review
- **Summary**: Count of outdated packages and update status

### Benefits
- Keeps dependencies up-to-date automatically
- Security vulnerabilities addressed promptly
- PR-based workflow allows review before updates
- Regular scheduled checks ensure consistency

---

## 5. Code Review (code-review.yml)

### Purpose
Automates code quality checks, security scanning, and testing for pull requests.

### Trigger Type
- **Pull request events**: Triggers on PR open, synchronize, or reopen targeting `main` branch

### Key Jobs/Steps

1. **Lint Job**
   - Checks out code with full history
   - Sets up Node.js environment
   - Runs ESLint for code quality
   - Checks code formatting

2. **Test Job**
   - Installs dependencies
   - Runs unit tests
   - Generates coverage report
   - Uploads coverage to Codecov

3. **Security Scan Job**
   - Runs CodeQL analysis for JavaScript
   - Performs npm audit for known vulnerabilities
   - Scans for exposed secrets using TruffleHog

4. **Static Analysis Job**
   - Runs SonarQube scan (if configured)
   - Performs code quality analysis

5. **Review Summary Job**
   - Aggregates results from all checks
   - Generates comprehensive review summary

### Output/Result Interpretation

- **Success**: All checks pass (lint, tests, security, static analysis)
- **Failure**: Any check fails, blocking merge until fixed
- **Coverage**: Test coverage percentage displayed
- **Security**: Vulnerabilities and code quality issues highlighted
- **Summary**: Overall review status with individual check results

### Benefits
- Ensures code quality before merging
- Prevents security vulnerabilities from entering codebase
- Automated testing reduces manual review burden
- Comprehensive PR validation

---

## 6. Documentation Deployment (documentation.yml)

### Purpose
Automatically builds and deploys documentation to GitHub Pages when documentation files change.

### Trigger Type
- **Push events**: Triggers on pushes to `main` branch when files in `docs/` or markdown files change
- **Workflow dispatch**: Manual triggering available

### Key Jobs/Steps

1. **Build Docs Job**
   - Checks out code
   - Sets up Node.js environment
   - Installs documentation dependencies
   - Builds documentation (supports MkDocs, Docsify, or custom builds)
   - Uploads documentation artifacts

2. **Deploy Docs Job** (depends on build)
   - Downloads documentation artifacts
   - Configures GitHub Pages
   - Uploads documentation artifact
   - Deploys to GitHub Pages
   - Generates deployment summary with URL

### Output/Result Interpretation

- **Success**: Documentation successfully built and deployed
- **URL**: Live documentation URL provided in summary
- **Artifacts**: Built documentation files saved (retained for 30 days)
- **Summary**: Deployment status and access URL

### Benefits
- Automatic documentation updates
- Always up-to-date documentation
- Easy access via GitHub Pages
- Supports multiple documentation frameworks

---

## 7. Custom Workflow (custom-workflow.yml)

### Purpose
Automatically generates release notes based on commits since the last release tag.

### Trigger Type
- **Release events**: Triggers when a new release is published
- **Workflow dispatch**: Manual triggering with tag input

### Key Jobs/Steps

1. **Generate Release Notes Job**
   - Checks out code with full history
   - Identifies current and previous release tags
   - Fetches commits since last release
   - Generates formatted release notes markdown
   - Extracts PR numbers from commit messages
   - Creates release notes file
   - Uploads release notes as artifact
   - Commits release notes to repository
   - Updates GitHub release with generated notes

### Output/Result Interpretation

- **Success**: Release notes generated and attached to release
- **File**: `RELEASE_NOTES.md` created with commit history
- **Artifacts**: Release notes and PR numbers saved (retained for 90 days)
- **Summary**: Release tag, previous tag, and commit count

### Benefits
- Automates release note generation
- Consistent release documentation
- Saves time during release process
- Provides commit history summary

---

## Workflow Dependencies

```
ci.yml                    → Standalone (triggers on push/PR)
deploy.yml               → Depends on: build artifacts
scheduled-tasks.yml      → Standalone (scheduled)
dependency-updates.yml   → Standalone (scheduled, creates PR)
code-review.yml          → Standalone (triggers on PR)
documentation.yml        → Depends on: build-docs artifacts
custom-workflow.yml      → Standalone (triggers on release)
```

## Required GitHub Secrets

For workflows to function properly, configure these secrets in repository settings:

- `HEROKU_API_KEY` - For Heroku deployments (deploy.yml)
- `HEROKU_APP_NAME` - Heroku application name (deploy.yml)
- `AWS_ACCESS_KEY_ID` - AWS access key (deploy.yml)
- `AWS_SECRET_ACCESS_KEY` - AWS secret key (deploy.yml)
- `AWS_REGION` - AWS region (deploy.yml)
- `SONAR_TOKEN` - SonarQube authentication token (code-review.yml)
- `SONAR_HOST_URL` - SonarQube server URL (code-review.yml)

## Security Best Practices

✅ **Secrets Management**: All sensitive credentials stored in GitHub Secrets  
✅ **No Plaintext**: No credentials hardcoded in workflow files  
✅ **Environment Permissions**: Proper permission scopes for each job  
✅ **Security Scanning**: Automated vulnerability detection in code-review.yml  
✅ **Secret Scanning**: TruffleHog scans for accidentally committed secrets  

## Testing & Verification

To verify workflows are working:

1. **CI Workflow**: Push code to main branch or create a PR
2. **Deploy Workflow**: Push to main or manually trigger with environment selection
3. **Scheduled Tasks**: Wait for scheduled time or manually trigger
4. **Dependency Updates**: Wait for schedule or manually trigger
5. **Code Review**: Create a pull request targeting main branch
6. **Documentation**: Push changes to docs/ folder or markdown files
7. **Custom Workflow**: Create a new release tag

## Workflow Status

Check workflow runs in GitHub Actions tab:
- Green checkmark ✅ = Success
- Red X ❌ = Failure
- Yellow circle ⏸️ = In progress
- Gray circle ⏭️ = Skipped

## Artifacts Retention

- Test results: Available for download from workflow runs
- Build artifacts: Available for deployment
- Documentation: Retained for 30 days
- Dependency reports: Retained for 7 days
- Release notes: Retained for 90 days
- Maintenance logs: Retained for 30 days

---

**Last Updated**: $(date)  
**Repository**: https://github.com/Saad-Abdulah/SCD_Assignment-2

