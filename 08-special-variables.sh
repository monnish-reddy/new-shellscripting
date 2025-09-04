#!/bin/bash

echo "all variables passsd to the script : $@"
echo "number of variables passed to the script $#"
echo "script name $0"
echo "present working directory $PWD"
echo "home directory of the user $HOME"
echo "pid of the script $$"
sleep 10 &
echo "pid of the last command running in the background $!"