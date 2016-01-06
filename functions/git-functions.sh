#!/bin/bash
function git-search-file{
    for branch in $(git rev-list --all)
    do
      if (git ls-tree -r --name-only $branch | grep --quiet "$1") 
      then
         echo $branch
      fi
    done
}
export -f git-search-file

function git-show-branches() {
  
  branches=$(git for-each-ref --format='%(refname)' refs/ | sed 's|refs/heads/||')

  for branch in $branches; do
    
    desc=$(git config branch.$branch.description | tr '\n' ' ')
    if [ $branch == $(git rev-parse --abbrev-ref HEAD) ]; then
       branch="* \033[0;32m$branch\033[0m"
     else
       branch="  $branch"
     fi
     echo -e "$branch \033[0;36m$desc\033[0m"
  done
}

export -f git-show-branches