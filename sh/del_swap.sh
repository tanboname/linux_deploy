#!/bin/bash
#-------------CopyRight-------------
#   Name:create swap
#   Date:2016-06-16
#   Author:tanbo
#   Email:me@tanbo.name
#   Website:http://www.tanbo.name
#   github:https://github.com/tanboname/linux_deploy
#-----------------------------------

function func_help()
{
     echo "Usage: del_swap.sh swapfile"
}


if [ "$1" = "" ];then
    func_help;
    exit;
fi

swapoff $1

rm $1
