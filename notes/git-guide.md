# Git Guide

A few handy commands in one handy place.

### Updating .gitignore and enforcing it

When you want to ignore additional files or folders, you have to update your ``.gitignore``.  After you make the additions or changes, you have to remove the cached files from the local repository, add them back, commit again to the local and push to the remote repositories:

```git
git rm -r --cached .
git add .
git commit -m "Ignore list update"
```

To push the locally committed changes back to your remote repo:

```git
git push
```

### PowerShell script to sync with git

This is a handy script I keep on my desktop (or an easy to find document folder) which I launch whenever I work with documents outside of a coding tool that need to be quickly pushed to Git.

```powershell
Write-Host 'Pushing changes to Git for my app!';

$dir = "C:\Users\username\source\repos\reponame\"
Set-Location $dir

Write-Output '';
Write-Output 'Adding locally...'
git add .

Write-Output '';
Write-Output "Committing locally..."
git commit -m 'Scripted commit'

Write-Output '';
Write-Output "Pulling latest from git..."
git pull origin main

Write-Output '';
Write-Output "Pushing latest to git..."
git push origin main

Write-Output '';
Write-Host 'Finished!';
Start-Sleep -Seconds 1
```

### Switching GitHub account on a developer computer

This command will allow you to switch the account when working with Git in the command prompt:

```git
git config credential.username new@account.com
```

However, this pops up the Git window to sign-in each time you run a git command.  To avoid the prompt pop-up, pick the access token method in the pop-up and paste it in for your account.  The pop-up shouldn't come up again.

Also, it's worthwhile to change your default branch to main from master, as that's the new GitHub default branch name.

```git
git config --list
git config --global init.defaultbranch main
```

### Import directory into git

```git
git init
git add .
git commit -m 'Initial commit'
git push ...
```

### Ignoring files during deployments

A yml file dictates how your app deployment behaves.  An app update should not occur when the yml file is itself updated because the yml file doesn't change how the app works.  

Here's a sample yml file that has the ignore directive.  When repo push occurs, anything under the directory .github will not cause the app to deploy (the build and deploy job part of the yml is not shown):

```yml
on:
  push:
    paths-ignore:
      - '.github/**'
    branches:
      - main
```

### Excluding web.config from your source code
``git update-index --assume-unchanged web.config``

### Installing Git on Windows

- Get the latest installation file for Windows from <a href="https://git-scm.com/downloads" target="_blank">git-scm.com/downloads</a>
- At the GNU General Public License, hit Next
- Select Destination Location
  - C:\Program Files\Git
- Select Components
  - Checked
    - Git LFS (Large File Support)
    - Associate .git* configuration files with the default text editor
    - Associate .sh files to be run with Bash
    - (NEW!) Scalar (Git add-on to manage large-scale repositories)
- Select Start Menu Folder
  - Git
- Choosing the default editor used by Git
  - Use Notepad as Git's default editor
- Adjusting the name of the initial branch in new repositories
  - Override the default branch name for new repositories
    - main
- Adjusting your PATH environment
  - Git from the command line and also from 3rd-party software
- Choosing the SSH executable
  - Use bundled OpenSSH
- Choosing HTTPS transport backend
  - Use the native Windows Secure Channel library
- Configuring the line ending conversions
  - Checkout Windows-style, commit Unix-style line endings
- Configuring the terminal emulator to use with Git Bash
  - Use Windows' default console window
- Choose the default behavior of 'git pull'
  - Fast-forward or merge - this will update your project if you have not made any changes yet, or merge if you have
- Choose a credential helper
  - Git Credential Manager
- Configuring extra options
  - Enable file system caching
- Select Install

### Good .gitignore notes
- <a href="https://www.atlassian.com/git/tutorials/saving-changes/gitignore" target="_blank">Atlassian .gitignore file notes</a>
