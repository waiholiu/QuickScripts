# What is this

This is just a collection of scripts you can run globally on your system to make it easy to do things.

# How to set this up

- Clone repo 
- Run the deploy.ps1 file to copy the scripts to the bin directory.
- add the bin directory to the PATH environment variable.   
- Then you can just run this using Win-R and type the bat file name - newrepo, reminder etc.


# Scripts

## New Repo

Type "newrepo" and it'll create a new repo in a specific directory, git init it then boots up VS Code so you can start working on it.

Reminder to set the base directory in the script.

## Reminder

This script allows you to quickly set a reminder

In the Windows Run command, you can type 

``` 
reminder 5 "email the client back"
```
It will remind you in 5 minutes to email the client back.



## New Folder

Type "newfolder" and it'll create a new folder in the quickrepos directory then boots up VS Code so you can start working on it. Good for quickly cloning repos off github.

Reminder to set the base directory in the script.


## Find Git Remote

This will essentially search all sub directories in the current directory and find all git repos with a remote url that matches the search term

Eg.  findGitRemote.ps1 "quick" "C:\Users\wailiu\Source\repos" will return  C:\Users\wailiu\Source\repos\QuickScripts

If no directory is specified it'll use the current directory. So you can go findGitRemote.ps1 "quick"

## findGitNoRemote.ps1

like FindGitRemote, but it'll return all the git repos with no remotes attached

