#!/bin/bash
# Enabling all hosts in /etc/nginx/sites-available

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`
source $SCRIPTPATH/settings.sh

case "$1" in
	create)
		if [[ ! -f $NGX_NXHOST/templates/$2 ]]; then
			echo "Unknown template '$2'"
			exit 1;
		fi
		
		if [[ ! $3 ]]; then
			echo "You must specify host file name"
			exit 2;
		fi
		
		if [ $2 == "project" ] && [ ! $4 ]; then
			echo "You must specify project type"
			exit 2;
		fi
		
		IFSBAK=$IFS
		IFS=""
		
		_host=`cat $NGX_NXHOST/templates/$2`
		_host=${_host//\[name\]/`echo $3`}
		if [[ $4 ]]; then
			_host=${_host//\[type\]/`echo $4`}
		fi
		echo $_host > $NGX_SITES_AVAILABLE/$3
		
		IFS=$IFSBAK
		
		bash $SCRIPTPATH/enableall.sh
		
		echo "Host created:"
		echo " - vhost: $NGX_SITES_AVAILABLE/$3"
		echo " - root:  $NGX_SHARE/$3"
	;;
	
 	-h)
		echo "Commands: create <template> <host_file_name>"
	;;
	
	*)
		echo "Use one of predefined commands"
	;;
esac