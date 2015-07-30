#!/bin/bash
function config_me_as_ansible (){
	echo "Adding ansible repo and installing it"
	apt-add-repository ppa:ansible/ansible
	apt-get update
	apt-get install software-properties-common ansible
	exit 0
}

[ ! "$(id -u )"  ] && echo "This script sould run as root under updated ubuntu 1404" && exit 2

while :
do
  case "$1" in
    ansible)
		config_me_as_ansible
    ;;
    mysql)
    ROLE="$1"
    config_me_as_mysql_server
    shift 1
    ;;
    client)
    ROLE="$1"
		config_me_as_client
    shift 1
    ;;
    *)  # No more options
    break 
    ;;
    esac
done

