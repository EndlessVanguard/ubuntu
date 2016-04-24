cd $HOME/<project>

git fetch github
git merge github/master

npm install
grunt

sails-migrations migrate
