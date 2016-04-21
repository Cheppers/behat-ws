#!/bin/bash

set -euo pipefail

if [ $# -ne 1 ]; then echo "Argument hostname is required."; exit 1; fi

if [[ "$(grep -e "127.0.0.1 $1" /etc/hosts)" == "" ]]; then
  echo "127.0.0.1 $1" >> /etc/hosts
fi
sed s%\{\{pwd\}\}%$(pwd)/docroot%g template.conf | sed s/\{\{host\}\}/$(echo $1)/g > /etc/apache2/other/$1.conf
sed s%\{\{pwd\}\}%$(pwd)%g behat.template.yml | sed s/\{\{host\}\}/$(echo $1)/g > ./behat.yml
apachectl restart
