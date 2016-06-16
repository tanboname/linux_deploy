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
     echo "Usage: create_swap.sh [-s size] [-o output]"
     echo "-s size(MB)"
     echo "-o output path"
}

size=0
output=""

while getopts s:o: option
do
    case "$option" in
        s)
        #echo $OPTARG
	    size=$OPTARG;;

        o)
         #   echo $OPTARG
            output=$OPTARG;;
        \?)
            func_help;
            exit 1;;
    esac
done

#echo $size $output

if [ "$size" = "0" -o "$output" = "" ];then
    func_help;
    exit;
fi

let count=$size*1024*1024/4096

dd if=/dev/zero of=$output bs=4096 count=$count
mkswap -f $output
swapon $output



