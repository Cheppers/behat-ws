#!/bin/bash

set -eou pipefail

if [ $# -ne 1 ]; then
  echo 'Pass a database url as first argument, eg. "mysql://sqluser:mypass@localhost/db"
Make sure the database exists or the user has database creation privileges.'
  exit 1
fi

if [ -d docroot ]; then
  chmod -R 777 docroot
  rm -rf docroot
fi
vendor/bin/drush make -y src/profiles/behat_ws/project-core.make.yml docroot
vendor/bin/drush make -y src/profiles/behat_ws/project.make.yml --no-core --contrib-destination=docroot/sites/all/
ln -fs $(pwd)/src/profiles/behat_ws ./docroot/profiles/behat_ws

pushd docroot

if [ ! -f docroot/sites/default/settings.php ]; then
  drush si -y behat_ws --db-url=$1
else
  drush si -y behat_ws
fi

popd
