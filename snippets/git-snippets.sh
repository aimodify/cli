#!/bin/bash

# git log-files
git log --pretty=format:"%h - %an, %ar : %s" --name-status

# git log-files in "oneline" format
git log --pretty=format:"%h - %an, %ar : %s"

# git log only merges in "oneline" format
git log origin/develop --merges --pretty=oneline