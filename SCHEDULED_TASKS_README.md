# Scheduled Tasks - Assignment

## Student Information
- **Name**: Saad Abdullah
- **Assignment**: CLO 4 - Scheduled Tasks using GitHub Actions
- **Project**: SCD Assignment 2 - GitHub Actions Workflows

---

## Assignment Requirement Met ✅

**Task**: Set up scheduled tasks using GitHub Actions

**Requirements**:
1. ✅ Runs on predefined schedule (weekly)
2. ✅ Performs maintenance tasks
3. ✅ Executes automated processes
4. ✅ Provides relevant notifications and logs

---

## Implementation

### Workflow File: `.github/workflows/scheduled-tasks.yml`

**Workflow Name**: Scheduled Maintenance Tasks

**Trigger**: 
- **Schedule**: Every Sunday at midnight UTC (`0 0 * * 0`)
- **Manual**: Can be triggered via workflow_dispatch

**Jobs**:

#### Job: Weekly Maintenance
**Purpose**: Perform weekly system checks and cleanup

**Steps**:
1. **Checkout Repository** - Get latest code
2. **Setup Node.js** - Install runtime
3. **Cleanup Old Artifacts** - Remove old logs (7+ days)
4. **Database Backup Simulation** - Create backup logs
5. **Dependency Audit** - Run npm audit
6. **Check Outdated Packages** - Run npm outdated
7. **Generate Report** - Create maintenance log
8. **Upload Logs** - Save maintenance reports (30 days retention)

---

## Tasks Performed

### 1. Cleanup
**Purpose**: Remove old temporary files

**Actions**:
- Removes log files older than 7 days
- Cleans up temporary build files
- Frees disk space

**Output**:
```
🧹 Cleaning up old build artifacts...
✅ Cleanup complete
```

### 2. Backup Simulation
**Purpose**: Create backup logs

**Actions**:
- Generates backup timestamp
- Creates backup log file
- Stores backup metadata

**Output**:
```
💾 Simulating database backup...
✅ Backup timestamp: [timestamp]
```

### 3. Dependency Audit
**Purpose**: Check for security vulnerabilities

**Actions**:
- Runs `npm audit` for security checks
- Checks for outdated packages
- Identifies update opportunities

**Output**:
```
🔒 Running dependency audit...
✅ Security audit complete
```

### 4. Outdated Packages Check
**Purpose**: Monitor dependency versions

**Actions**:
- Runs `npm outdated`
- Lists packages needing updates
- Provides update recommendations

**Output**:
```
📦 Checking for outdated packages...
✅ Dependency check complete
```

---

## How to Interpret Results

### ✅ Success Indicators:
```
✅ SCHEDULED MAINTENANCE COMPLETED
📅 Date: [timestamp]
⏰ Next run: Next Sunday at midnight UTC
```

**What this means**:
- All maintenance tasks completed
- System is healthy
- No critical issues found

### ⚠️ Warnings:
```
⚠️ Found outdated dependencies
📦 3 packages need updates
```

**Action**: Review outdated packages and update if needed

```
⚠️ Security vulnerabilities found
🔒 2 moderate vulnerabilities detected
```

**Action**: Run `npm audit fix` or review vulnerabilities

---

## Manual Execution

To run maintenance tasks manually:

1. Go to **Actions** tab
2. Select **Scheduled Tasks** workflow
3. Click **Run workflow**
4. Select branch: **main**
5. Click **Run workflow**

---

## Accessing Maintenance Logs

1. Go to **Actions** tab
2. Click on **Scheduled Tasks** workflow
3. Select a workflow run
4. Scroll to **Artifacts** section
5. Download: `maintenance-logs-[number]`

**Retention**: Logs are kept for 30 days

---

## Schedule Details

**Current Schedule**: Every Sunday at midnight UTC

**Cron Expression**: `0 0 * * 0`

**Breakdown**:
- `0` - Minute (0th minute)
- `0` - Hour (0th hour = midnight)
- `*` - Day of month (every day)
- `*` - Month (every month)
- `0` - Day of week (Sunday)

**Convert to Your Timezone**:
- UTC: Sunday 00:00
- EST: Saturday 19:00 (or 20:00 during DST)
- PST: Saturday 16:00 (or 17:00 during DST)

---

## Customizing Schedule

To change the schedule, edit `.github/workflows/scheduled-tasks.yml`:

```yaml
schedule:
  - cron: "0 0 * * 0"  # Weekly (Sunday)
  # - cron: "0 2 * * *"  # Daily at 2 AM
  # - cron: "0 0 1 * *"  # Monthly (1st of month)
```

**Common Schedules**:
- Daily: `0 2 * * *` (2 AM UTC)
- Weekly: `0 0 * * 0` (Sunday midnight)
- Monthly: `0 0 1 * *` (1st of month)

---

## Assignment Completion ✅

✅ **Scheduled tasks workflow implemented**  
✅ **Runs on predefined schedule (weekly)**  
✅ **Performs maintenance tasks**  
✅ **Provides logs and notifications**  
✅ **Manual trigger available**  
✅ **Artifact retention configured**

---

**Repository**: https://github.com/Saad-Abdulah/SCD_Assignment-2  
**Date**: January 2025

