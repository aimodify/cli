#!/bin/bash

alias g="git"

alias gb="git branch -vv"
alias gba="git branch -a -vv"
alias gA="git branch -a -vv"

#edit description for current branch
alias gbdesc="git branch --edit-description"

alias gs="git status"
alias gss="git status -s"
alias gf="git fetch origin"

#git log with author name
alias glau="git log  --format='%h %s [ %an ]'"
#git log graph
alias glg="git log --oneline --decorate --graph --all"

#show log last 3 commits
alias gll="git log -3"

#show oneline-log 
alias glog="git log --oneline"

#show whole information about file commits
alias glog-file="git log --oneline --follow "

#show whole information about file commits
alias glog-statfile="git log --oneline --stat --follow "

#show oneline-log with only merges
alias glog-merges="git log --oneline --merges"


#show remote
alias gr="git remote && git remote -v"
#count remotes branches
alias gre="git config --get remote.origin ; git branch -a | wc -l "
#count remote show origin
alias gro="git remote show origin"

#checkout file 
alias gc="git checkout --"

alias gf="git diff"
alias gds="git diff --stat"
alias gw="git diff --word-diff"


alias gdiff="git diff --cached --stat"

alias gbau="git for-each-ref --format='%(authorname) :: %(refname)'"



alias gstat="git show --stat"

alias ga="git add"




#git log merges only
#alias ="git log origin/develop --merges --pretty=oneline"



# Git-Repo-URL
alias gi-repourl="git config --list | grep url"

# Git-Repo-NAME
alias gi-repo="git config --list | grep url"

#show current repository url 
alias gi-reporemote="git config --get remote.origin.url"


alias gco="git checkout"





__git_complete gco _git_checkout

