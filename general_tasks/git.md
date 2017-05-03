# git.md

## git orphan branches

git init
git remote add origin https://github.com/BlueJarvis23/architecture.git
git pull origin master
git checkout --orphan <branch_name>
git commit
git push origin <branch_name>


## git stash

git stash apply "stash@{0}"
git stash pop "pop@{0}"




