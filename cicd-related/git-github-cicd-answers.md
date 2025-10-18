# Git, GitHub & CI/CD Interview Questions & Answers

## GitHub and Git-Specific Questions

### 1. What is Git, and how does it differ from GitHub?

**Git** is a distributed version control system (VCS) that tracks changes in source code during software development. It was created by Linus Torvalds in 2005 and runs locally on your machine.

**GitHub** is a cloud-based hosting platform for Git repositories. It provides a web interface and additional collaboration features on top of Git.

**Key Differences:**
- Git is the tool/software; GitHub is a service that hosts Git repositories
- Git works offline; GitHub requires internet connectivity
- Git is free and open-source; GitHub offers free and paid tiers
- GitHub adds features like pull requests, issues, project boards, CI/CD (Actions), and collaboration tools

**Analogy:** Git is like Microsoft Word (the software), and GitHub is like Google Docs (the platform with additional collaboration features).

---

### 2. Explain the core concepts of Git

**Repository (Repo):** A directory that contains your project files and the complete history of all changes. It includes the `.git` folder with all version control metadata.

**Commit:** A snapshot of your repository at a specific point in time. Each commit has:
- Unique SHA-1 hash identifier
- Author information
- Timestamp
- Commit message
- Pointer to parent commit(s)

**Branch:** An independent line of development. The default branch is usually `main` or `master`. Branches allow you to work on features without affecting the main codebase.

**Merge:** The process of integrating changes from one branch into another. Git combines the histories and creates a merge commit.

**Additional Key Concepts:**
- **Staging Area (Index):** Intermediate area where commits are prepared before being finalized
- **Working Directory:** Your current local files
- **Remote:** A version of your repository hosted on a server (like GitHub)
- **HEAD:** Pointer to the current branch reference

---

### 3. Describe the workflow of using Git for collaborative development

**Standard Git Workflow:**

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   ```

2. **Create a feature branch**
   ```bash
   git checkout -b feature/new-feature
   ```

3. **Make changes and commit**
   ```bash
   git add .
   git commit -m "Add new feature"
   ```

4. **Keep branch updated with main**
   ```bash
   git fetch origin
   git rebase origin/main
   ```

5. **Push branch to remote**
   ```bash
   git push origin feature/new-feature
   ```

6. **Create Pull Request (PR) on GitHub**
   - Navigate to repository on GitHub
   - Click "New Pull Request"
   - Add description, reviewers, and labels
   - Request code review

7. **Code Review Process**
   - Team members review code
   - Make requested changes
   - Push additional commits to same branch

8. **Merge PR**
   - Once approved, merge into main branch
   - Delete feature branch

9. **Update local main branch**
   ```bash
   git checkout main
   git pull origin main
   ```

**Branching Strategy Example (Git Flow):**
- `main`: Production-ready code
- `develop`: Integration branch for features
- `feature/*`: New features
- `hotfix/*`: Emergency production fixes
- `release/*`: Release preparation

---

### 4. What is the difference between `git pull` and `git fetch`?

**git fetch:**
- Downloads commits, files, and refs from remote repository
- Updates your remote-tracking branches (e.g., `origin/main`)
- Does NOT modify your working directory or current branch
- Safe operation that won't cause merge conflicts

```bash
git fetch origin
# Now you can inspect changes before merging
git log origin/main
```

**git pull:**
- Combination of `git fetch` + `git merge`
- Downloads changes AND immediately merges them into current branch
- Can cause merge conflicts if there are divergent changes
- Equivalent to: `git fetch origin` followed by `git merge origin/main`

```bash
git pull origin main
# This fetches and merges in one step
```

**When to use which:**
- Use `fetch` when you want to see what others have done before integrating
- Use `pull` when you're confident about merging changes immediately
- Best practice: Use `fetch` first to inspect, then merge manually

---

### 5. How do you resolve a merge conflict in Git?

**Merge conflicts occur when:**
- Same file is modified in different branches
- Git cannot automatically determine which changes to keep

**Resolution Steps:**

1. **Identify conflicted files**
   ```bash
   git status
   # Shows files with conflicts
   ```

2. **Open conflicted file(s)**
   You'll see conflict markers:
   ```
   <<<<<<< HEAD
   Your changes in current branch
   =======
   Changes from branch being merged
   >>>>>>> feature-branch
   ```

3. **Resolve conflicts manually**
   - Edit the file to keep desired changes
   - Remove conflict markers (`<<<<<<<`, `=======`, `>>>>>>>`)
   - Combine or choose between conflicting changes

4. **Stage resolved files**
   ```bash
   git add <resolved-file>
   ```

5. **Complete the merge**
   ```bash
   git commit
   # Or if rebasing:
   git rebase --continue
   ```

6. **Verify resolution**
   ```bash
   git log --graph --oneline
   ```

**Tools to help:**
- `git mergetool` - Opens configured merge tool
- VS Code, IntelliJ, or other IDEs with built-in merge conflict resolution
- `git diff` - To review changes

**Abort if needed:**
```bash
git merge --abort
# or
git rebase --abort
```

---

### 6. Explain the purpose of `git rebase` and when to use it

**Purpose of Rebase:**
Rebase re-applies commits from your branch onto another base commit, creating a linear history without merge commits.

**How it works:**
```bash
git checkout feature
git rebase main
```
This takes commits from `feature` branch and replays them on top of `main`.

**When to use Rebase:**
1. **Clean up local history** before pushing
2. **Keep feature branch updated** with main branch
3. **Create linear history** for easier reading
4. **Interactive rebase** to squash/edit/reorder commits

**When to use Merge:**
1. **Feature branch is already pushed** and shared
2. **Preserving exact history** is important
3. **Working on public branches**

**Key Differences:**

| Aspect | Rebase | Merge |
|--------|--------|-------|
| History | Linear, clean | Preserves complete history |
| Commits | Rewrites commit hashes | Creates new merge commit |
| Conflicts | Resolve per commit | Resolve once |
| Use case | Private branches | Public/shared branches |

**Golden Rule:** Never rebase commits that have been pushed to public/shared repositories, as it rewrites history.

**Interactive Rebase Example:**
```bash
git rebase -i HEAD~3
# Opens editor to squash, reword, or reorder last 3 commits
```

---

### 7. What is a "detached HEAD" state in Git?

**Detached HEAD** means HEAD is pointing directly to a commit instead of pointing to a branch reference.

**How it occurs:**
1. **Checking out a specific commit:**
   ```bash
   git checkout abc1234
   ```

2. **Checking out a tag:**
   ```bash
   git checkout v1.0.0
   ```

3. **After certain rebase operations**

**What it means:**
- You're viewing repository at a specific point in time
- Any new commits won't belong to any branch
- These commits can be lost if you switch branches

**Visual representation:**
```
Normal state:
HEAD -> main -> commit_xyz

Detached HEAD:
HEAD -> commit_abc (no branch reference)
```

**How to handle it:**

**If you want to keep changes:**
```bash
# Create a new branch from detached HEAD
git checkout -b new-branch-name
```

**If you want to discard changes:**
```bash
# Switch back to a branch
git checkout main
```

**Warning message:**
Git will warn you: "You are in 'detached HEAD' state" and explain that commits made here can be lost.

**Common use cases:**
- Inspecting old commits
- Testing historical versions
- Temporary experimentation without affecting branches

---

### 8. How do you revert a specific commit that has already been pushed?

**Three main approaches:**

**1. git revert (Recommended for shared branches):**
Creates a new commit that undoes changes from a specific commit.

```bash
# Revert single commit
git revert <commit-hash>

# Revert multiple commits
git revert <commit-hash-1> <commit-hash-2>

# Revert a range
git revert <oldest-commit>..<newest-commit>

# Push the revert
git push origin main
```

**Advantages:**
- Safe for shared branches
- Preserves history
- No rewriting of history

**2. git reset (Only for private branches):**
Moves branch pointer backward, removing commits.

```bash
# Soft reset (keeps changes staged)
git reset --soft <commit-hash>

# Mixed reset (keeps changes unstaged)
git reset --mixed <commit-hash>

# Hard reset (discards all changes)
git reset --hard <commit-hash>

# Force push (DANGEROUS on shared branches)
git push origin main --force
```

**Warning:** Never use on shared/public branches!

**3. git rebase -i (Interactive rebase):**
Remove or edit commits interactively.

```bash
git rebase -i HEAD~5
# In editor, delete or mark commits as "drop"
git push --force
```

**Best Practice Decision Tree:**
- Commit is on shared branch → Use `git revert`
- Commit is only local → Use `git reset` or `git rebase -i`
- Need to preserve history → Use `git revert`
- Need clean history → Use `git reset` or `git rebase -i`

---

### 9. What are Git hooks, and how can they be used in a CI/CD pipeline?

**Git Hooks** are scripts that Git executes automatically before or after events like commit, push, and merge.

**Location:** `.git/hooks/` directory in your repository

**Types of Hooks:**

**Client-side hooks:**
- `pre-commit`: Runs before commit is created (linting, formatting)
- `prepare-commit-msg`: Modify default commit message
- `commit-msg`: Validate commit message format
- `post-commit`: Runs after commit is created (notifications)
- `pre-push`: Runs before push (run tests)
- `post-checkout`: Runs after checkout (environment setup)

**Server-side hooks:**
- `pre-receive`: Runs before accepting pushed commits
- `update`: Runs for each branch being updated
- `post-receive`: Runs after push is accepted (trigger CI/CD)

**CI/CD Use Cases:**

**1. Enforce Code Quality (pre-commit):**
```bash
#!/bin/sh
# .git/hooks/pre-commit

# Run linter
npm run lint
if [ $? -ne 0 ]; then
  echo "Linting failed. Commit aborted."
  exit 1
fi

# Run tests
npm test
if [ $? -ne 0 ]; then
  echo "Tests failed. Commit aborted."
  exit 1
fi
```

**2. Validate Commit Messages (commit-msg):**
```bash
#!/bin/sh
# Enforce conventional commit format

commit_msg=$(cat "$1")
pattern="^(feat|fix|docs|style|refactor|test|chore)(\(.+\))?: .{1,50}"

if ! echo "$commit_msg" | grep -qE "$pattern"; then
  echo "Invalid commit message format!"
  echo "Use: type(scope): message"
  exit 1
fi
```

**3. Trigger CI/CD (post-receive):**
```bash
#!/bin/sh
# Server-side hook to trigger Jenkins build

curl -X POST https://jenkins.example.com/job/build/build?token=SECRET
```

**4. Prevent Force Push (pre-receive):**
```bash
#!/bin/sh
# Protect main branch from force push

while read oldrev newrev refname; do
  if [ "$refname" = "refs/heads/main" ]; then
    if [ "$oldrev" != "0000000000000000000000000000000000000000" ]; then
      # Check if it's a force push
      merge_base=$(git merge-base $oldrev $newrev)
      if [ "$merge_base" != "$oldrev" ]; then
        echo "Force push to main is not allowed!"
        exit 1
      fi
    fi
  fi
done
```

**Limitations:**
- Not version controlled (in `.git/hooks/`)
- Different on each developer's machine
- Can be bypassed with `--no-verify` flag

**Better Alternative for Teams:**
- Use **Husky** (npm package) to share hooks via version control
- Use **pre-commit framework** (Python)
- Enforce checks on CI/CD server instead

---

### 10. Discuss branching strategies (GitFlow and others)

**1. GitFlow:**

Most structured branching model, ideal for projects with scheduled releases.

**Branches:**
- `main`: Production code, always stable
- `develop`: Integration branch, latest features
- `feature/*`: New features (branch from develop)
- `release/*`: Release preparation (branch from develop)
- `hotfix/*`: Emergency fixes (branch from main)

**Workflow:**
```
feature/login → develop → release/v1.0 → main
                                        ↓
                                      hotfix/urgent → develop
```

**Pros:**
- Clear separation of concerns
- Parallel development
- Structured release process

**Cons:**
- Complex for small teams
- Slower pace
- Many long-lived branches

---

**2. GitHub Flow:**

Simplified workflow, ideal for continuous deployment.

**Branches:**
- `main`: Always deployable
- `feature/*`: Short-lived feature branches

**Workflow:**
1. Create branch from main
2. Make changes and commit
3. Open pull request
4. Review and discuss
5. Merge to main
6. Deploy immediately

**Pros:**
- Simple and easy to understand
- Fast deployment cycle
- Fewer branches to manage

**Cons:**
- Less suitable for scheduled releases
- Requires robust CI/CD
- No clear release points

---

**3. Trunk-Based Development:**

All developers work on a single branch (trunk/main) with very short-lived feature branches.

**Rules:**
- Feature branches live < 1 day
- Frequent small commits to main
- Feature flags for incomplete features
- Continuous integration required

**Pros:**
- Reduces merge conflicts
- Encourages continuous integration
- Fast feedback loops
- Simplifies workflow

**Cons:**
- Requires discipline
- Needs feature flags
- Requires excellent test coverage

---

**4. Release Branching:**

Simple model for versioned releases.

**Branches:**
- `main`: Active development
- `release/v1.x`: Maintenance branches for versions

**Workflow:**
- Develop on main
- Create release branch when ready
- Bug fixes go to release branch and main
- Each version has its own maintenance branch

---

**5. Environment Branching:**

Branches represent environments (not recommended).

**Branches:**
- `development`
- `staging`
- `production`

**Why it's problematic:**
- Difficult to track what's deployed
- Merge conflicts increase
- Hard to maintain multiple environments
- Better to use tags/releases instead

---

**Choosing a Strategy:**

| Project Type | Recommended Strategy |
|--------------|---------------------|
| Web apps with CD | GitHub Flow |
| Mobile apps | GitFlow |
| Libraries/Packages | GitFlow |
| Microservices | Trunk-Based |
| Enterprise software | GitFlow or Release Branching |
| Small teams | GitHub Flow |
| Large teams | Trunk-Based or GitFlow |

---

### 11. How do you secure your Git repositories on GitHub?

**1. Access Control:**
- Use **branch protection rules** on main/develop branches
- Require pull request reviews before merging
- Enable **CODEOWNERS** file for automatic reviewer assignment
- Use **teams** for permission management
- Enable **two-factor authentication (2FA)** for all contributors
- Use **least privilege principle** for repository access

**2. Branch Protection Settings:**
```
Settings → Branches → Branch protection rules:
☑ Require pull request reviews before merging
☑ Require status checks to pass before merging
☑ Require conversation resolution before merging
☑ Require signed commits
☑ Include administrators
☑ Restrict who can push to matching branches
☑ Require linear history
☑ Block force pushes
```

**3. Secret Management:**
- **Never commit secrets** (passwords, API keys, tokens)
- Use **GitHub Secrets** for CI/CD workflows
- Use `.gitignore` to exclude sensitive files
- Scan for secrets using tools:
  - git-secrets
  - truffleHog
  - GitHub Secret Scanning (automatic)
- Use **environment variables** for configuration
- Rotate secrets regularly

**4. Dependency Security:**
- Enable **Dependabot alerts** for vulnerable dependencies
- Enable **Dependabot security updates** for automatic patching
- Review and approve Dependabot PRs
- Use **npm audit**, **pip check**, etc.
- Pin dependency versions

**5. Code Scanning:**
- Enable **GitHub Advanced Security** (CodeQL)
- Set up **third-party security scanning** (SonarQube, Snyk)
- Scan for:
  - Security vulnerabilities
  - Code quality issues
  - License compliance

**6. Audit and Monitoring:**
- Review **audit logs** regularly
- Monitor **webhook deliveries**
- Track **access patterns**
- Set up **security advisories**
- Use **GitHub Security Overview** dashboard

**7. Signed Commits:**
```bash
# Configure GPG signing
git config --global commit.gpgsign true
git config --global user.signingkey YOUR_GPG_KEY

# Verify signatures
git log --show-signature
```

**8. Repository Settings:**
- Disable **force push** on protected branches
- Disable **branch deletion** for important branches
- Enable **push protection** for secrets
- Limit **repository visibility** (private vs public)
- Review **installed GitHub Apps** permissions

**9. Security Policy:**
Create `SECURITY.md` in repository root:
```markdown
# Security Policy

## Reporting a Vulnerability
Please report security vulnerabilities to security@example.com

## Supported Versions
| Version | Supported |
| ------- | --------- |
| 1.x     | ✅        |
| < 1.0   | ❌        |
```

**10. Best Practices:**
- Regular security training for team
- Perform security reviews during code review
- Keep dependencies updated
- Follow OWASP guidelines
- Implement security in CI/CD pipeline

---

## CI/CD Specific Questions

### 1. What is CI/CD, and why is it important?

**CI/CD** stands for Continuous Integration and Continuous Delivery/Deployment.

**Continuous Integration (CI):**
- Developers frequently merge code changes into central repository
- Automated builds and tests run on every commit
- Detects integration issues early

**Continuous Delivery (CD):**
- Code is automatically prepared for release to production
- Manual approval required for production deployment
- Deployments are low-risk, routine events

**Continuous Deployment:**
- Every change that passes automated tests is automatically deployed to production
- No manual approval needed
- Fully automated release process

**Why CI/CD is Important:**

1. **Faster Time to Market:**
   - Reduces manual tasks
   - Automates repetitive processes
   - Enables frequent releases

2. **Improved Code Quality:**
   - Automated testing catches bugs early
   - Consistent build process
   - Code review integration

3. **Reduced Risk:**
   - Smaller, incremental changes
   - Easy rollback capabilities
   - Frequent testing

4. **Better Collaboration:**
   - Shared responsibility
   - Transparent process
   - Immediate feedback

5. **Increased Productivity:**
   - Developers focus on coding
   - Less time on manual tasks
   - Automated error detection

6. **Cost Efficiency:**
   - Early bug detection is cheaper
   - Reduced manual testing effort
   - Optimized resource usage

---

### 2. Difference between CI, Continuous Delivery, and Continuous Deployment

**Visual Representation:**
```
Code → Build → Test → [CI ends here]
                ↓
         Package & Prepare → [Continuous Delivery ends here]
                ↓
      Manual Approval Gate
                ↓
         Deploy to Production → [Continuous Deployment]
```

**Continuous Integration (CI):**
- **What:** Automated building and testing of code changes
- **When:** Every commit or merge to main branch
- **Goal:** Catch integration issues early
- **Outcome:** Verified, tested code ready for delivery
- **Manual Steps:** None (fully automated)

**Example:**
```yaml
CI Pipeline:
1. Developer pushes code
2. Automated build triggered
3. Unit tests run
4. Integration tests run
5. Code quality checks
6. Artifact created
✓ Code is verified and ready
```

**Continuous Delivery:**
- **What:** Automated deployment to staging/pre-production
- **When:** After successful CI
- **Goal:** Keep code in deployable state
- **Outcome:** Code ready for production, awaiting approval
- **Manual Steps:** Manual approval for production deployment

**Example:**
```yaml
Delivery Pipeline:
1. CI pipeline passes
2. Deploy to staging automatically
3. Run smoke tests
4. Notify team
5. [MANUAL] Review and approve
6. [MANUAL] Click deploy button
✓ Deployed to production
```

**Continuous Deployment:**
- **What:** Fully automated deployment to production
- **When:** After passing all tests
- **Goal:** Zero-touch production releases
- **Outcome:** Code automatically in production
- **Manual Steps:** None (fully automated)

**Example:**
```yaml
Deployment Pipeline:
1. CI pipeline passes
2. Deploy to staging
3. Automated acceptance tests
4. Automatically deploy to production
5. Monitor for issues
6. Automated rollback if needed
✓ In production without human intervention
```

**Key Differences:**

| Aspect | CI | Continuous Delivery | Continuous Deployment |
|--------|----|--------------------|----------------------|
| Automation | Build & Test | Up to staging | End-to-end |
| Production Deploy | Manual | Manual approval | Automatic |
| Risk | Low | Medium | Requires high confidence |
| Maturity Required | Basic | Intermediate | Advanced |
| Speed | Fast feedback | Slower releases | Fastest releases |
| Human Intervention | None | Approval step | None |

**Which to Choose:**

- **CI only:** Starting out, building foundation
- **Continuous Delivery:** Need compliance approvals, scheduled releases
- **Continuous Deployment:** Web apps, SaaS, mature teams with excellent testing

---

### 3. Key benefits of implementing a CI/CD pipeline

**1. Faster Development Cycle:**
- Automated processes reduce manual work
- Parallel execution of tasks
- Quick feedback on changes
- Reduced time from code to production (days → hours)

**2. Improved Code Quality:**
- Automated testing on every commit
- Consistent code standards enforcement
- Early bug detection
- Static code analysis integration
- Security vulnerability scanning

**3. Reduced Risk:**
- Smaller, frequent deployments
- Easy rollback mechanisms
- Tested in production-like environments
- Reduced "works on my machine" issues
- Incremental changes easier to debug

**4. Increased Productivity:**
- Developers focus on coding, not deployment
- Reduced context switching
- Automated repetitive tasks
- Less time troubleshooting integration issues
- Faster onboarding for new team members

**5. Better Collaboration:**
- Shared ownership of pipeline
- Transparent build and deployment status
- Consistent environments across team
- Clear feedback on code changes
- Improved communication between dev and ops

**6. Cost Efficiency:**
- Earlier bug detection (cheaper to fix)
- Reduced manual testing effort
- Optimized resource utilization
- Fewer production incidents
- Less downtime

**7. Faster Time to Market:**
- Rapid feature delivery
- Quick response to customer feedback
- Competitive advantage
- Ability to experiment and iterate

**8. Improved Reliability:**
- Consistent deployment process
- Automated testing reduces human error
- Reproducible builds
- Environment parity (dev, staging, prod)

**9. Enhanced Visibility:**
- Real-time build status
- Deployment history and audit trail
- Metrics and analytics
- Automated notifications

**10. Scalability:**
- Easy to add new services
- Parallel pipeline execution
- Infrastructure as code
- Automated scaling

**Measurable Benefits:**
- Deploy frequency: Increased by 200-300%
- Lead time: Reduced from weeks to hours
- Mean time to recovery (MTTR): Reduced by 50%
- Change failure rate: Decreased by 30%
- Developer satisfaction: Significantly improved

---

### 4. Typical stages of a CI/CD pipeline

**Complete Pipeline Flow:**

```
1. Source → 2. Build → 3. Test → 4. Package → 5. Deploy → 6. Monitor
```

**Stage 1: Source / Trigger**
- Code pushed to repository
- Pull request created
- Scheduled trigger (nightly builds)
- Manual trigger
- Webhook from external system

**Stage 2: Build**
- Checkout code from repository
- Install dependencies
- Compile code
- Generate artifacts (JAR, Docker image, etc.)
- Version tagging

**Example:**
```yaml
build:
  - npm install
  - npm run build
  - docker build -t app:$VERSION .
```

**Stage 3: Test**

**3a. Unit Tests:**
- Fast, isolated tests
- Test individual components
- Run on every commit

**3b. Integration Tests:**
- Test component interactions
- Database connections
- API integrations

**3c. Code Quality:**
- Linting
- Code coverage analysis
- Static code analysis (SonarQube)
- Security scanning

**Example:**
```yaml
test:
  unit_tests:
    - npm run test:unit
  integration_tests:
    - npm run test:integration
  code_quality:
    - npm run lint
    - sonar-scanner
```

**Stage 4: Package / Artifact Creation**
- Create deployable artifacts
- Store in artifact repository
- Tag with version number
- Generate release notes

**Example:**
```yaml
package:
  - docker push registry.io/app:$VERSION
  - npm publish
  - zip deployment-package.zip
```

**Stage 5: Deploy**

**5a. Deploy to Staging:**
- Automated deployment
- Smoke tests
- Database migrations

**5b. Deploy to Production:**
- Blue-green deployment
- Canary release
- Rolling update
- Approval gate (for Continuous Delivery)

**Example:**
```yaml
deploy_staging:
  - kubectl apply -f k8s/staging/
  - run smoke tests

deploy_production:
  - requires: manual_approval
  - kubectl apply -f k8s/production/
  - health check
```

**Stage 6: Monitor & Feedback**
- Application monitoring
- Log aggregation
- Performance metrics
- Error tracking
- Automated rollback triggers
- Notifications

**Example:**
```yaml
monitor:
  - check_health_endpoint
  - verify_metrics
  - send_notification
  - if error_rate > 5%: rollback
```

**Additional Optional Stages:**

**Security Scanning:**
- Dependency vulnerability scan
- Container image scanning
- Secret detection
- Compliance checks

**Performance Testing:**
- Load testing
- Stress testing
- Benchmark comparisons

**Approval Gates:**
- Manual review required
- Compliance sign-off
- Scheduled deployment windows

**Complete Example Pipeline:**
```yaml
pipeline:
  stages:
    - source
    - build
    - test
    - security_scan
    - package
    - deploy_dev
    - integration_test
    - deploy_staging
    - acceptance_test
    - approval_gate
    - deploy_production
    - monitor
    - notify
```

---

### 5. Popular CI/CD tools and their main features

**1. Jenkins**

**Type:** Self-hosted, open-source

**Main Features:**
- Highly customizable with 1,500+ plugins
- Declarative and scripted pipelines (Jenkinsfile)
- Distributed builds with master-agent architecture
- Support for any language/platform
- Blue Ocean UI for visual pipeline editor
- Integration with virtually any tool

**Jenkinsfile Example:**
```groovy
pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'npm install'
            }
        }
        stage('Test') {
            steps {
                sh 'npm test'
            }
        }
    }
}
```

**Pros:** Flexible, mature, large community
**Cons:** Steep learning curve, maintenance overhead, UI feels dated

---

**2. GitLab CI/CD**

**Type:** Integrated with GitLab, self-hosted or SaaS

**Main Features:**
- Built into GitLab platform
- YAML-based configuration (.gitlab-ci.yml)
- Docker container-based runners
- Auto DevOps for automatic CI/CD setup
- Built-in container registry
- Kubernetes integration
- Environment management
- Review apps

**. gitlab-ci.yml Example:**
```yaml
stages:
  - build
  - test
  - deploy

build_job:
  stage: build
  script:
    - npm install
    - npm run build
  artifacts:
    paths:
      - dist/

test_job:
  stage: test
  script:
    - npm test

deploy_job:
  stage: deploy
  script:
    - kubectl apply -f k8s/
  only:
    - main
```

**Pros:** Integrated experience, easy to set up, good documentation
**Cons:** Tied to GitLab ecosystem

---

**3. GitHub Actions**

**Type:** Cloud-based, integrated with GitHub

**Main Features:**
- Native GitHub integration
- YAML-based workflows
- Marketplace with thousands of actions
- Matrix builds for parallel testing
- Secrets management
- Reusable workflows
- Self-hosted runners available
- Event-driven (not just Git events)

**Workflow Example:**
```yaml
name: CI/CD Pipeline

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-node@v3
        with:
          node-version: '18'
      - run: npm ci
      - run: npm test
      - run: npm run build
```

**Pros:** Easy to use, great for GitHub projects, generous free tier
**Cons:** Vendor lock-in, limited customization vs Jenkins

---

**4. CircleCI**

**Type:** Cloud-based or self-hosted

**Main Features:**
- YAML configuration (.circleci/config.yml)
- Docker layer caching
- Parallel testing
- Workflow orchestration
- SSH debugging
- Orbs (reusable config packages)
- Performance insights

**Config Example:**
```yaml
version: 2.1

jobs:
  build:
    docker:
      - image: cimg/node:18.0
    steps:
      - checkout
      - run: npm install
      - run: npm test

workflows:
  version: 2
  build_and_test:
    jobs:
      - build
```

**Pros:** Fast builds, good caching, clean UI
**Cons:** Pricing can be expensive, limited free tier

---

**5. Azure DevOps (Azure Pipelines)**

**Type:** Cloud or self-hosted

**Main Features:**
- YAML or visual designer
- Multi-cloud deployment
- Tight integration with Azure services
- Build and release pipelines
- Environments and approvals
- Artifact management
- Test management
- Free for open-source

**azure-pipelines.yml Example:**
```yaml
trigger:
  - main

pool:
  vmImage: 'ubuntu-latest'

steps:
  - task: NodeTool@0
    inputs:
      versionSpec: '18.x'
  - script: |
      npm install
      npm test
    displayName: 'npm install and test'
```

**Pros:** Enterprise features, Azure integration, generous free tier
**Cons:** Complex for simple projects

---

**6. Travis CI**

**Type:** Cloud-based

**Main Features:**
- YAML configuration (.travis.yml)
- Matrix builds
- GitHub integration
- Free for open-source