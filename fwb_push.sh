#!/bin/bash
#
# Copyright (C) 2021 Arjun Ingole
#

read -p "Please Enter the link to Repository you want to push to : " LINK
read -p "Please Enter the branch you want to push too : " BRANCH

# Change Origin
git remote remove origin
git remote add origin $LINK

# Setup Branch
git branch $BRANCH

# Let's Push
echo "*******< Starting To Push >********"
git push -u origin HEAD~50000:refs/heads/$BRANCH
git push -u origin HEAD~40000:refs/heads/$BRANCH
git push -u origin HEAD~20000:refs/heads/$BRANCH
git push -u origin HEAD~10000:refs/heads/$BRANCH
git push -u origin HEAD~5000:refs/heads/$BRANCH

# The Final Push
git push -u origin HEAD:refs/heads/$BRANCH

