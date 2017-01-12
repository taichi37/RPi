#!/bin/sh

declare -a tagDir=( a ap d e f k kde kdei l n t tcl x xap xfce y )

tagPath=$1
destPath=/tmp/dest

LXC=/tmp/lxc.base
Compile=/mnt/floppy/slackpkg/compile.template
Fs=/mnt/floppy/slackpkg/freeswitch.template


for i in ${tagDir[@]}
do
  mkdir -p $destPath/$i
  cat /dev/null > $destPath/$i/tagfile

  for j in `cat $tagPath/$i/tagfile`
  do
    pkgName=`echo $j | cut -d : -f 1`

    if grep ^${pkgName}$ $LXC >& /dev/null
    then 
      echo ${pkgName}:ADD >> $destPath/$i/tagfile
    elif grep ^${pkgName}$ $Compile >& /dev/null
    then
      echo ${pkgName}:ADD >> $destPath/$i/tagfile
    elif grep ^${pkgName}$ $Fs >& /dev/null
    then
      echo ${pkgName}:ADD >> $destPath/$i/tagfile
    else
      echo ${pkgName}:SKP >> $destPath/$i/tagfile
    fi

  done
done
