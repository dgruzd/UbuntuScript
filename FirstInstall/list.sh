#!/bin/sh

DIR=`pwd`
SUFFIX="sh"

rm -iv list.txt

#for i in "$DIR"/*.$SUFFIX
#do
#echo ${i%%.$SUFFIX} |sed 's#^.*/##' >> list.txt
#done
find . -iname "*.sh" | sort | sed 's/\.\///g' |sed 's/\.sh//g' >> list.txt
cat list.txt
