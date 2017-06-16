#!/bin/bash
# Enabling all hosts in /etc/nginx/sites-available

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`
source $SCRIPTPATH/settings.sh

cd $NGX_SITES_AVAILABLE/

for file in *
do
	rm $NGX_SITES_ENABLED/$file > /dev/null 2>&1;
	ln -s $NGX_SITES_AVAILABLE/$file $NGX_SITES_ENABLED/$file
	
	mkdir $NGX_LOG/$file/ > /dev/null 2>&1
	mkdir $NGX_SHARE/$file/ > /dev/null 2>&1
done

chown -R $NGX_USER $NGX_SHARE/
chmod -R $NGX_RIGHT $NGX_SHARE/