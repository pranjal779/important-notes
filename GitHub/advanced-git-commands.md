# Advanced Git Commands Guide

## Start a Working Area Commands

### `git clone <url>`
**Purpose:** Copy an entire repository from a remote location to your local machine.

**Usage:**
```bash
# Clone via HTTPS
git clone https://github.com/username/repository.git

# Clone via SSH
git clone git@github.com:username/repository.git

# Clone into a specific folder
git clone https://github.com/username/repo.git my-folder

# Clone only the latest commit (shallow clone)
git clone --depth 1 https://github.com/username/repo.git
```

**What it does:**
- Downloads entire repository history
- Creates a new directory with the repo name
- Sets up remote tracking (origin)
- Checks out the default branch (usually main/master)

**When to use:**
- Starting work on an existing project
- Getting a copy of someone else's code
- Creating a local backup

---

### `git init`
**Purpose:** Create a new Git repository in the current directory.

**Usage:**
```bash
# Initialize in current directory
git init

# Initialize with a specific branch name
git init -b main

# Create and initialize a new directory
git init my-project

# Initialize a bare repository (for servers)
git init --bare
```

**What it does:**
- Creates a `.git` directory with all necessary metadata
- Starts tracking changes in the directory
- No files are tracked initially (until you `git add` them)

**When to use:**
- Starting a new project from scratch
- Converting an existing project to use Git
- Creating a local repository before pushing to GitHub

**Example Workflow:**
```bash
mkdir my-new-project
cd my-new-project
git init
echo "# My Project" > README.md
git add README.md
git commit -m "Initial commit"
```

---

## Work on Current Changes

### `git add <file>`
**Purpose:** Stage changes for the next commit (prepare files to be committed).

**Usage:**
```bash
# Stage a specific file
git add file.txt

# Stage multiple files
git add file1.txt file2.txt

# Stage all changes in current directory
git add .

# Stage all changes in repository
git add -A
# or
git add --all

# Stage only modified and deleted files (not new files)
git add -u

# Interactive staging (choose what to stage)
git add -p
# or
git add --patch

# Stage all .js files
git add *.js

# Stage all files in a directory
git add src/
```

**Interactive Staging (`-p` flag):**
When you use `git add -p`, Git shows you each change and asks:
```
Stage this hunk [y,n,q,a,d,s,e,?]?
y - stage this hunk
n - do not stage this hunk
q - quit; do not stage this or any remaining hunks
a - stage this and all remaining hunks
d - do not stage this or any remaining hunks
s - split the current hunk into smaller hunks
e - manually edit the current hunk
? - print help
```

**What it does:**
- Moves changes from "working directory" to "staging area"
- Doesn't affect the repository yet (that's what commit does)
- You can stage parts of files, not just whole files

**Git Areas Explained:**
```
Working Directory → Staging Area (Index) → Repository
     (untracked)      (git add)            (git commit)
```

---

### `git mv <source> <destination>`
**Purpose:** Move or rename files and automatically stage the change.

**Usage:**
```bash
# Rename a file
git mv old-name.txt new-name.txt

# Move a file to a directory
git mv file.txt directory/

# Move and rename at once
git mv src/old.js lib/new.js

# Move multiple files
git mv file1.txt file2.txt directory/
```

**Why use `git mv` instead of regular `mv`?**

**Without git mv:**
```bash
mv old.txt new.txt
git rm old.txt        # You have to do this
git add new.txt       # And this
```

**With git mv:**
```bash
git mv old.txt new.txt  # Single command, automatically staged
```

**What it does:**
- Moves/renames the file in your working directory
- Stages the change automatically
- Preserves file history (Git tracks the rename)

**Important:** Git doesn't explicitly track renames. It detects them based on file similarity. Use `git log --follow <file>` to see history across renames.

---

### `git restore <file>`
**Purpose:** Discard changes in working directory or unstage files (introduced in Git 2.23 as a clearer alternative to `git checkout`).

**Usage:**

**Discard changes in working directory:**
```bash
# Restore a single file to last committed state
git restore file.txt

# Restore multiple files
git restore file1.txt file2.txt

# Restore all files in current directory
git restore .

# Restore all tracked files
git restore :/
```

**Unstage files (remove from staging area):**
```bash
# Unstage a file (keep changes in working directory)
git restore --staged file.txt

# Unstage all files
git restore --staged .
```

**Restore from a specific commit:**
```bash
# Restore file from a specific commit
git restore --source=HEAD~2 file.txt

# Restore from a specific branch
git restore --source=main file.txt
```

**Restore and unstage together:**
```bash
# Unstage and discard changes
git restore --staged --worktree file.txt
# or shorthand:
git restore -SW file.txt
```

**Important Flags:**
- `--staged` or `-S`: Only affect staging area
- `--worktree` or `-W`: Only affect working directory
- `--source=<tree>`: Restore from specific commit/branch

**Comparison with old commands:**
```bash
# Old way (still works)
git checkout -- file.txt          # Discard changes

# New way (clearer)
git restore file.txt              # Discard changes

# Old way (confusing)
git reset HEAD file.txt           # Unstage

# New way (clearer)
git restore --staged file.txt     # Unstage
```

**Warning:** `git restore` without `--staged` will **permanently discard** your uncommitted changes. Use carefully!

---

### `git rm <file>`
**Purpose:** Remove files from working directory and staging area (delete files and stage the deletion).

**Usage:**
```bash
# Remove a file and stage the deletion
git rm file.txt

# Remove multiple files
git rm file1.txt file2.txt

# Remove all .log files
git rm *.log

# Remove directory and its contents
git rm -r directory/

# Remove from Git but keep in working directory
git rm --cached file.txt

# Force removal (if file has uncommitted changes)
git rm -f file.txt
# or
git rm --force file.txt

# Dry run (see what would be removed)
git rm --dry-run file.txt
```

**Important Flags:**

**`--cached` (most commonly used):**
```bash
# Remove from Git tracking but keep file locally
git rm --cached secrets.env

# Useful for files you accidentally committed
git rm --cached node_modules/ -r
```

**After removing, you must commit:**
```bash
git rm file.txt
git commit -m "Remove file.txt"
```

**Difference from regular `rm`:**
```bash
# Regular rm (you must stage deletion manually)
rm file.txt
git add file.txt

# Git rm (deletion is automatically staged)
git rm file.txt
```

**Common Use Case - Remove from Git but keep locally:**
```bash
# You committed sensitive data by mistake
git rm --cached config/secrets.yml
echo "config/secrets.yml" >> .gitignore
git add .gitignore
git commit -m "Stop tracking secrets file"
```

---

## Examine History and State

### `git bisect`
**Purpose:** Use binary search to find the commit that introduced a bug.

**How it works:**
1. You mark a "good" commit (bug doesn't exist)
2. You mark a "bad" commit (bug exists)
3. Git checks out commits in between
4. You test and mark each as "good" or "bad"
5. Git narrows down to the problematic commit

**Usage:**

**Basic workflow:**
```bash
# Start bisect session
git bisect start

# Mark current commit as bad
git bisect bad

# Mark a known good commit (e.g., 10 commits ago)
git bisect good HEAD~10
# or use a specific commit hash
git bisect good abc1234

# Git checks out a middle commit
# Test your application...
# If bug exists:
git bisect bad
# If bug doesn't exist:
git bisect good

# Repeat until Git finds the problematic commit

# End bisect session
git bisect reset
```

**Automated bisect with a test script:**
```bash
git bisect start
git bisect bad HEAD
git bisect good v1.0

# Run automated test
git bisect run npm test
# Git will automatically mark commits as good/bad based on test exit code
# Exit code 0 = good, non-zero = bad

git bisect reset
```

**Example with script:**
```bash
# Create a test script
cat > test.sh << 'EOF'
#!/bin/bash
npm test
exit $?
EOF

chmod +x test.sh

# Run bisect
git bisect start
git bisect bad
git bisect good v2.0.0
git bisect run ./test.sh
```

**Bisect commands:**
```bash
git bisect start           # Start bisect
git bisect bad [commit]    # Mark as bad
git bisect good [commit]   # Mark as good
git bisect skip            # Skip current commit (if can't test)
git bisect reset           # End session and return to original HEAD
git bisect log             # Show bisect log
git bisect visualize       # Visualize remaining commits
```

**Real-world example:**
```bash
# Scenario: Bug appeared between v1.0 and now
git bisect start
git bisect bad HEAD              # Current version has bug
git bisect good v1.0             # v1.0 was working fine

# Git says: "Bisecting: 50 revisions left to test after this"
# Test your app... bug exists
git bisect bad

# Git says: "Bisecting: 25 revisions left to test after this"
# Test your app... no bug
git bisect good

# Continue until...
# Git says: "abc1234 is the first bad commit"
git bisect reset
git show abc1234
```

**Why use it:**
- Manual checking of hundreds of commits would take forever
- Binary search is efficient: log₂(n) checks
- 1000 commits? Only ~10 checks needed!

---

### `git grep <pattern>`
**Purpose:** Search for text patterns in your repository files (like `grep` but Git-aware).

**Usage:**

**Basic search:**
```bash
# Search for a pattern
git grep "function"

# Case-insensitive search
git grep -i "TODO"

# Show line numbers
git grep -n "error"

# Search in specific files
git grep "bug" -- "*.js"

# Search in specific directory
git grep "API" src/

# Count matches per file
git grep -c "import"
```

**Advanced search:**
```bash
# Show function/class containing the match
git grep -p "database"

# Search with context (3 lines before and after)
git grep -C 3 "password"

# Only show matching part of line
git grep -o "http://[^\"]*"

# Search for whole word only
git grep -w "test"

# Combine patterns (AND)
git grep -e "user" --and -e "password"

# Either pattern (OR)
git grep -e "error" -e "warning"

# Exclude pattern
git grep "log" --and --not -e "debug"
```

**Search in specific commits or branches:**
```bash
# Search in a specific commit
git grep "bug" abc1234

# Search in a specific branch
git grep "feature" origin/main

# Search in all branches
git grep "TODO" $(git rev-list --all)

# Search in tags
git grep "version" v1.0.0
```

**Useful combinations:**
```bash
# Find files containing "password"
git grep -l "password"

# Find files NOT containing "license"
git grep -L "license"

# Show filename only for matches
git grep --name-only "secret"

# Search with regex
git grep -E "user(name|email)"

# Search for exact string (not regex)
git grep -F "some.special$chars"
```

**Practical examples:**
```bash
# Find all TODO comments with line numbers
git grep -n "TODO\|FIXME"

# Find console.log statements in JavaScript files
git grep "console\.log" -- "*.js"

# Find hardcoded credentials
git grep -i "password\|secret\|api_key"

# Find deprecated function usage
git grep "oldFunctionName"

# Count how many times each file uses "import"
git grep -c "^import" -- "*.js"
```

**Why use `git grep` instead of regular `grep`:**
- Faster (only searches tracked files)
- Respects `.gitignore`
- Can search in any commit/branch
- Better integration with Git
- Ignores `.git` directory automatically

---

### `git show`
**Purpose:** Display information about Git objects (commits, tags, trees, blobs).

**Usage:**

**Show commit details:**
```bash
# Show latest commit (HEAD)
git show

# Show specific commit
git show abc1234

# Show commit with only filenames
git show --name-only abc1234

# Show commit with file stats
git show --stat abc1234

# Show commit without diff
git show --no-patch abc1234
# or shorthand:
git show -s abc1234
```

**Show specific file from commit:**
```bash
# Show file content from HEAD
git show HEAD:file.txt

# Show file from specific commit
git show abc1234:path/to/file.txt

# Show file from branch
git show main:README.md

# Show file from 3 commits ago
git show HEAD~3:config.json
```

**Show tags:**
```bash
# Show annotated tag details
git show v1.0.0

# Show commit that tag points to
git show v1.0.0^{}
```

**Show branches:**
```bash
# Show latest commit on branch
git show main

# Show specific commit on branch
git show feature-branch~2
```

**Show diffs:**
```bash
# Show diff of a commit
git show abc1234

# Show only added lines
git show abc1234 --diff-filter=A

# Show only modified lines
git show abc1234 --diff-filter=M

# Show changes with word diff
git show --word-diff abc1234
```

**Format output:**
```bash
# Show commit in one line
git show --oneline abc1234

# Show commit with custom format
git show --format="%an %ae %ad" abc1234

# Show only commit message
git show --format=%B -s abc1234

# Pretty format
git show --pretty=fuller abc1234
```

**Multiple objects:**
```bash
# Show multiple commits
git show abc1234 def5678

# Show range of commits
git show main~3..main
```

**Practical examples:**
```bash
# Who wrote this line and when?
git show HEAD:file.txt | grep "function"

# Show what changed in last commit
git show

# Show specific file changes in a commit
git show abc1234 -- path/to/file.txt

# Compare file between commits
git show abc1234:file.txt > old.txt
git show def5678:file.txt > new.txt
diff old.txt new.txt

# Show commit with author details
git show --format="%an <%ae> - %ad" abc1234

# Show commit message only
git show -s --format=%s abc1234

# Export file from old commit
git show abc1234:oldfile.txt > recovered-file.txt
```

**Common use cases:**
- Review what changed in a commit
- Retrieve old version of a file
- Inspect tag information
- Debug what was in a specific commit
- View commit author and timestamp

---

### `git sparse-checkout`
**Purpose:** Check out only specific files/directories from a repository (partial clone).

**Why use it:**
- Large monorepos (you only need a small part)
- Save disk space and clone time
- Only download what you need

**Setup and usage:**

**Enable sparse checkout:**
```bash
# Clone repository
git clone --sparse https://github.com/user/repo.git
cd repo

# Initialize sparse-checkout
git sparse-checkout init

# By default, only root files are checked out
```

**Add directories to sparse-checkout:**
```bash
# Add specific directory
git sparse-checkout set docs/

# Add multiple directories
git sparse-checkout set src/ tests/

# Add specific files
git sparse-checkout set README.md LICENSE

# Add patterns
git sparse-checkout set "*.md"
```

**Modify sparse-checkout:**
```bash
# Add more directories (keeps existing)
git sparse-checkout add tools/

# List current sparse-checkout
git sparse-checkout list

# Disable sparse-checkout (check out everything)
git sparse-checkout disable

# Re-enable with previous settings
git sparse-checkout reapply
```

**Cone mode (recommended):**
```bash
# Initialize with cone mode (faster, simpler)
git sparse-checkout init --cone

# Set directories (cone mode only accepts directories)
git sparse-checkout set src/ docs/
```

**Manual configuration:**
```bash
# Edit .git/info/sparse-checkout directly
echo "src/" >> .git/info/sparse-checkout
echo "!src/legacy/" >> .git/info/sparse-checkout  # Exclude
git sparse-checkout reapply
```

**Patterns:**
```bash
# Include directory and all subdirectories
docs/

# Include only specific subdirectory
docs/api/

# Exclude pattern (! prefix)
!src/legacy/

# Include specific file type
*.md

# Complex patterns
src/**/*.js
```

**Practical example:**

```bash
# Clone large repo with only partial checkout
git clone --filter=blob:none --sparse \
  https://github.com/microsoft/vscode.git
cd vscode

# Only check out extensions directory
git sparse-checkout init --cone
git sparse-checkout set extensions/

# Add more directories later
git sparse-checkout add src/vs/editor/

# List what's checked out
git sparse-checkout list
```

**Combine with partial clone:**
```bash
# Clone with blob filtering (no file contents initially)
git clone --filter=blob:none --sparse \
  https://github.com/user/monorepo.git

cd monorepo
git sparse-checkout init --cone
git sparse-checkout set my-team/my-project/

# Now only your project's files are downloaded
```

**Benefits:**
- Faster clones of large repos
- Less disk space used
- Faster checkout operations
- Only download what you need

**Use cases:**
- Working on microservice in monorepo
- Contributing to specific part of large project
- CI/CD optimization (only check out what's needed)
- Limited disk space environments

---

## Grow, Mark and Tweak History

### `git rebase`
**Purpose:** Reapply commits on top of another base commit (creates linear history).

**Basic usage:**
```bash
# Rebase current branch onto main
git rebase main

# Rebase feature branch onto develop
git checkout feature-branch
git rebase develop
```

**Interactive rebase:**
```bash
# Rebase last 5 commits interactively
git rebase -i HEAD~5

# Rebase since branching point
git rebase -i main
```

**Interactive rebase commands:**
When you run `git rebase -i`, an editor opens with:
```
pick abc1234 Add feature A
pick def5678 Fix typo
pick ghi9012 Add feature B

# Commands:
# p, pick = use commit
# r, reword = use commit, but edit message
# e, edit = use commit, but stop for amending
# s, squash = use commit, but meld into previous commit
# f, fixup = like squash, but discard commit message
# d, drop = remove commit
```

**Common interactive operations:**

**Squash commits:**
```bash
git rebase -i HEAD~3

# Change from:
pick abc1234 WIP
pick def5678 More changes
pick ghi9012 Final changes

# To:
pick abc1234 WIP
squash def5678 More changes
squash ghi9012 Final changes

# Results in single commit with combined message
```

**Reword commit message:**
```bash
git rebase -i HEAD~2

# Change:
pick abc1234 bad commit msg

# To:
reword abc1234 bad commit msg

# Editor will open to change message
```

**Reorder commits:**
```bash
# Just change the order in the interactive list
pick ghi9012 Third commit
pick abc1234 First commit
pick def5678 Second commit
```

**Drop commits:**
```bash
pick abc1234 Good commit
drop def5678 Bad commit that breaks things
pick ghi9012 Another good commit
```

**Handling conflicts during rebase:**
```bash
git rebase main
# CONFLICT appears

# Fix conflicts in files
git add resolved-file.txt

# Continue rebase
git rebase --continue

# Or skip this commit
git rebase --skip

# Or abort entirely
git rebase --abort
```

**Advanced rebase:**
```bash
# Rebase onto different branch
git rebase --onto new-base old-base branch

# Preserve merge commits
git rebase --preserve-merges main

# Automatic stash before rebase
git rebase --autostash main

# Execute command after each commit
git rebase -x "npm test" main
```

**Practical examples:**

**Clean up feature branch before PR:**
```bash
# You have messy commits
git log --oneline
# abc1234 WIP
# def5678 Fixed linting
# ghi9012 Added tests
# jkl3456 More WIP

git rebase -i HEAD~4
# Squash all into one clean commit
```

**Update feature branch with main:**
```bash
git checkout feature-branch
git rebase main
# Your feature commits now on top of latest main
```

**Move commits to different branch:**
```bash
# Move last 3 commits from main to feature branch
git branch feature
git reset --hard HEAD~3
git checkout feature
```

**Golden Rule:** **NEVER rebase commits that have been pushed to shared/public branches!** It rewrites history and causes problems for others.

**When to rebase:**
✅ Local commits not yet pushed
✅ Cleaning up your feature branch
✅ Keeping feature branch updated with main
✅ Before creating pull request

**When NOT to rebase:**
❌ Commits already pushed to shared branches
❌ Working on public/collaborative branches
❌ When you want to preserve exact history

---

### `git reset`
**Purpose:** Reset current HEAD to specified state (moves branch pointer backward).

**Three modes:**

**1. Soft reset (`--soft`):**
```bash
git reset --soft HEAD~1
```
- Moves HEAD back one commit
- **Keeps changes staged**
- **Keeps changes in working directory**
- Use case: Undo commit but keep changes staged for re-committing

**2. Mixed reset (` --mixed`, default):**
```bash
git reset HEAD~1
# or
git reset --mixed HEAD~1
```
- Moves HEAD back one commit
- **Unstages changes**
- **Keeps changes in working directory**
- Use case: Undo commit and unstage, but keep changes

**3. Hard reset (`--hard`):**
```bash
git reset --hard HEAD~1
```
- Moves HEAD back one commit
- **Discards staged changes**
- **Discards working directory changes**
- ⚠️ **WARNING: Permanently loses changes!**
- Use case: Completely undo commits and discard all changes

**Visual comparison:**
```
Commit history:     C3 (HEAD) ← C2 ← C1
After reset HEAD~1: C2 (HEAD) ← C1

--soft:  C3 changes are staged
--mixed: C3 changes are unstaged
--hard:  C3 changes are deleted
```

**Common uses:**

**Undo last commit (keep changes):**
```bash
git reset --soft HEAD~1
# Changes are still staged, ready to re-commit
```

**Undo last commit and unstage:**
```bash
git reset HEAD~1
# Changes are in working directory but not staged
```

**Completely discard commits:**
```bash
git reset --hard HEAD~3
# Last 3 commits are gone permanently
```

**Reset to specific commit:**
```bash
git reset --hard abc1234
# Reset to commit abc1234, discard everything after
```

**Unstage files:**
```bash
# Unstage specific file
git reset HEAD file.txt

# Unstage all files
git reset HEAD
```

**Reset to remote branch:**
```bash
# Discard all local commits, match remote
git reset --hard origin/main
```

**Practical scenarios:**

**Scenario 1: Wrong commit message**
```bash
git reset --soft HEAD~1
# Edit files if needed
git commit -m "Correct message"
```

**Scenario 2: Committed to wrong branch**
```bash
# On main branch by mistake
git reset --soft HEAD~1
git stash
git checkout feature-branch
git stash pop
git commit -m "Feature X"
```

**Scenario 3: Want to split one commit into multiple**
```bash
git reset HEAD~1
git add file1.txt
git commit -m "Part 1"
git add file2.txt
git commit -m "Part 2"
```

**Scenario 4: Completely start over**
```bash
git reset --hard origin/main
# Local branch now matches remote exactly
```

**Recovery from reset:**
```bash
# If you reset by mistake, use reflog
git reflog
# Find the commit hash you want to recover
git reset --hard abc1234
```

**Important differences:**

| Command | Commit | Staging | Working Dir |
|---------|--------|---------|-------------|
| `reset --soft` | ✓ Moved | Kept | Kept |
| `reset --mixed` | ✓ Moved | Cleared | Kept |
| `reset --hard` | ✓ Moved | Cleared | Cleared |

**When to use each:**
- `--soft`: Want to re-commit with changes
- `--mixed`: Want to restage selectively
- `--hard`: Want to completely discard changes (be careful!)

**⚠️ Warning:**
- `reset --hard` is **destructive**
- Resets on pushed commits require `git push --force` (dangerous on shared branches)
- Use `git reflog` to recover if you reset by mistake

---

### `git switch`
**Purpose:** Switch between branches (introduced in Git 2.23 as clearer alternative to `git checkout`).

**Basic usage:**
```bash
# Switch to existing branch
git switch main
git switch feature-branch

# Switch to previous branch
git switch -

# Create and switch to new branch
git switch -c new-branch
# or
git switch --create new-branch

# Create new branch from specific starting point
git switch -c hotfix main
git switch -c feature-x origin/develop
```

**Detached HEAD:**
```bash
# Switch to specific commit (detached HEAD)
git switch --detach abc1234

# Switch to tag (detached HEAD)
git switch --detach v1.0.0
```

**Force switch (discard local changes):**
```bash
# Switch and discard uncommitted changes
git switch -f main
# or
git switch --force main

# Discard changes and switch
git switch --discard-changes main
```

**Switch with merge:**
```bash
# Switch and merge changes from current branch
git switch -m new-branch
# or
git switch --merge new-branch
```

**Guess remote branch:**
```bash
# If remote branch exists, automatically set up tracking
git switch feature-x
# If local "feature-x" doesn't exist but "origin/feature-x" does,
# Git creates local branch and sets up tracking
```

**Common scenarios:**

**Create feature branch from main:**
```bash
git switch main
git pull
git switch -c feature/new-feature
```

**Switch between branches:**
```bash
git switch main
git switch feature-branch
git switch -  # Back to main
git switch -  # Back to feature-branch
```

**Discard changes and switch:**
```bash
# You have uncommitted changes you don't want
git switch -f other-branch
```

**Comparison: `git switch` vs `git checkout`:**

| Task | git switch | git checkout |
|------|-----------|-------------|
| Switch branch | `git switch main` | `git checkout main` |
| Create & switch | `git switch -c new` | `git checkout -b new` |
| Detached HEAD | `git switch --detach abc1234` | `git checkout abc1234` |
| Restore files | ❌ Can't do | `git checkout -- file.txt` |

**Why use `git switch`?**
- Clearer purpose (only for switching branches)
- Less confusing than `checkout` (which does many things)
- Modern Git best practice
- Safer (won't accidentally modify files)

**Note:** `git checkout` still works and is more versatile, but `git switch` is preferred for branch switching because it's more explicit.

---

### `git tag`
**Purpose:** Create, list, or delete tags (markers for specific points in history, usually for releases).

**Types of tags:**
1. **Lightweight tag:** Just a pointer to a commit
2. **Annotated tag:** Full Git object with tagger info, date, message (recommended for releases)

**Basic usage:**

**Create lightweight tag:**
```bash
# Tag current commit
git tag v1.0.0

# Tag specific commit
git tag v1.0.0 abc1234
```

**Create annotated tag (recommended):**
```bash
# Tag with message
git tag -a v1.0.0 -m "Release version 1.0.0"

# Tag specific commit with message
git tag -a v1.0.0 abc1234 -m "Release 1.0.0"

# Tag with editor for detailed message
git tag -a v1.0.0
```

**List tags:**
```bash
# List all tags
git tag

# List tags with pattern
git tag -l "v1.*"
git tag -l "v2.0.*"

# List tags with annotations
git tag -n
git tag -n5  # Show first 5 lines of annotation
```

**Show tag information:**
```bash
# Show tag details
git show v1.0.0

# Show commit tag points to
git show v1.0.0^{}
```

**Delete tags:**
```bash
# Delete local tag
git tag -d v1.0.0
# or
git tag --delete v1.0.0

# Delete remote tag
git push origin --delete v1.0.0
# or
git push origin :refs/tags/v1.0.0
```

**Push tags to remote:**
```bash
# Push single tag
git push origin v1.0.0

# Push all tags
git push origin --tags

# Push only annotated tags
git push origin --follow-tags
```

**Advanced operations:**

**Replace/move tag:**
```bash
# Force tag to point to different commit
git tag -f v1.0.0 abc1234
git push origin v1.0.0 --force
```

**Tag with GPG signature:**
```bash
# Create signed tag
git tag -s v1.0.0 -m "Signed release"

# Verify signed tag
git tag -v v1.0.0
```

**Checkout tag (creates detached HEAD):**
```bash
git checkout v1.0.0

# Better: create branch from tag
git checkout -b version-1 v1.0.0
```

**Practical examples:**

**Release workflow:**
```bash
# Ready to release version 1.2.0
git checkout main
git pull
git tag -a v1.2.0 -m "Release 1.2.0 - Bug fixes and improvements"
git push origin v1.2.0

# Or push main and tags together
git push origin main --follow-tags
```

**Semantic versioning tags:**
```bash
git tag -a v1.0.0 -m "Initial release"
git tag -a v