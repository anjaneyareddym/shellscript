#!/bin/bash
echo " All varibiles passed to the script :$@"

echo "Number of varibiles passed :$#"

echo "Script name  $0"

echo "current working directory $PWD"
echo "Home directory of :$HOME"
echo " PID of  script executing now:  $$"
sleep 100 &
echo "PID of last background command :$!"