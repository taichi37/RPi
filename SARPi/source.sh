#!/bin/sh

declare -a DIR=( a ap d e f k kde kdei l n t tcl x xap xfce y )

srcPath=$1
destPath=/tmp/tag

for i in ${DIR[@]}
do
  mkdir -p $destPath/$i
  # cp $1/$i/tagfile $destPath/$i/tagfile
  sed -f sedscr $1/$i/tagfile > $destPath/$i/tagfile
done

