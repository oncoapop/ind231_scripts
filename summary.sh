#!/bin/bash

wd=$HOME"/ind231"

# map structure out
cd $wd
tree -d

outdir=$HOME"/ind231_output"
outfile="summary_output"

type="germline"
subtype="indel"

dir=$HOME"/ind231/"$type"/"$subtype

cd $dir
files=`ls *COMPLETE*`
head=$type"_"$subtype

output=$outdir"/"$outfile"_"$type"_"$subtype".csv"

echo "SA_ID,"$head > $output
for file in $files
	do
	no=`cat $file | awk -F"," '{print $12}' | sort -u | wc -l`
	SA=`echo $file | awk -F"_" '{print $4}' | awk -F"." '{print $1}'`
	echo $SA","$no >> $output
	done
