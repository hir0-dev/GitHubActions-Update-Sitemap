#!/bin/bash -x

# set git configs
git config --global user.name "test user"
git config --global user.email "email@example.com"

git remote set-url origin https://hir0-dev:${GITHUB_TOKEN}@github.com/hir0-dev/GitHubActions-Update-Sitemap.git

# checkout master
git checkout master

# update sitemap.xml
now=$(TZ=Asia/Tokyo date "+%Y-%m-%dT%H:%M:%S%:z")
sed -i -e "s/[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}T[0-9]\{2\}:[0-9]\{2\}:[0-9]\{2\}+[0-9]\{2\}:[0-9]\{2\}/${now}/g" sitemap.xml

# commit
git add sitemap.xml
git commit -m "update sitemap.xml"
git push origin master