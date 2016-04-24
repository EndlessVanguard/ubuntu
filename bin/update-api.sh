PROJECT='<project>'
echo "Start deploy for $PROJECT\n"

cd /www-data/$PROJECT

ERROR_GIT=$(git pull --ff-only origin)
if [ "$ERROR_GIT" == "1" ]; then
  echo "Error: pulling from git origin; can we not fast forward?"
  exit 1;
fi

ERROR_NPM=$(npm install)
if [ "$ERROR_NPM" == "1" ]; then
  echo "Error: doing an npm install; check npm-debug.log"
  exit 1;
fi

service $PROJECT restart

cd -
