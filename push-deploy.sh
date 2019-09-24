#!/bin/sh
# If a command fails then the deploy stops
set -e
printf "\033[0;32mPush to branch hugo...\033[0m\n"
git add .
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
 msg="$*"
fi
git commit -m "$msg"
git push origin hugo

printf "\033[0;32mDeploy public hugo to branch master...\033[0m\n"
HUGO_ENV=production hugo # if using a theme, replace with `hugo -t <YOURTHEME>`
cd public
git add .
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"
git push origin master

printf "\033[0;32mPush to branch hugo...\033[0m\n"
cd ..
git add .
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"
git push origin hugo
