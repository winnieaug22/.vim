#!/usr/bin/env sh

git submodule foreach git pull origin master

# remove submodule
# $ cd your_project
# $ git rm --cached another_project
# $ rm -rf another_project
# $ vim .gitmodules
# ...remove another_project...
# $ vim .git/config
# ...remove another_project...
# $ git commit -a -m 'Remove another_project submodule'
