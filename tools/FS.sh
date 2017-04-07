#!/bin/sh

pi=template/pi.template
compile=template/compile.template
cmake=template/cmake.template
fs=template/freeswitch.template

srcPath=../slackwarearm/slackwarearm-14.2/slackware

declare -a DIR=( a ap d e f k kde kdei l n t tcl x xap xfce y )


tmpPath=/tmp/sarpi
rm -rf $tmpPath
mkdir -p $tmpPath

skp=${tmpPath}/skppath
add=${tmpPath}/tagpath
mkdir -p $tag $add


sort -o ${tmpPath}/sedscr-tmp $pi $compile $cmake $fs

for i in `cat ${tmpPath}/sedscr-tmp`
do
    echo "/^${i}/s/${i}:SKP/${i}:ADD/" >> ${tmpPath}/sedscr-add
done



for i in ${DIR[@]}
do
    mkdir -p ${skp}/${i}
    sed -f sedscr-skp ${srcPath}/${i}/tagfile > ${skp}/$i/tagfile
done



for i in ${DIR[@]}
do
    mkdir -p ${add}/${i}
    sed -f ${tmpPath}/sedscr-add ${skp}/${i}/tagfile > ${add}/${i}/tagfile
done


