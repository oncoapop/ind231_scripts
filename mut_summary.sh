#!/bin/bash

wd=$HOME"/ind231"

# map structure out
cd $wd
tree -d

outdir=$HOME"/ind231_output"
outfile="summary_output"

# germline, indel
########################################################################
type="germline"
subtype="indel"

dir=$HOME"/ind231/"$type"/"$subtype
echo $dir

cd $dir
files=`ls *PATHOGENIC*`
head=$type"_"$subtype

output=$outdir"/"$outfile"_"$type"_"$subtype".csv"

echo "SA_ID,"$head > $output
for file in $files
	do
	no=`cat $file | awk -F"," '{print $12}' | sort -u | wc -l`
	SA=`echo $file | awk -F"_" '{print $4}' | awk -F"." '{print $1}'`
	mut=`cat $file  | awk -F","  '{print $12","$21}'`
	echo $SA","$mut >> $output
	done

########################################################################

# germline, snv
########################################################################
type="germline"
subtype="snv"

dir=$HOME"/ind231/"$type"/"$subtype
echo $dir

cd $dir
files=`ls *PATHOGENIC*`
head=$type"_"$subtype

output=$outdir"/"$outfile"_"$type"_"$subtype".csv"

echo "SA_ID,"$head > $output
for file in $files
	do
	no=`cat $file | awk -F"," '{print $36}' | sort -u | wc -l`
	SA=`echo $file | awk -F"_" '{print $4}' | awk -F"." '{print $1}'`
	mut=`cat $file  | awk -F","  '{print $39","$35,$13","$48}'`
	echo $SA","$mut >> $output
	done

########################################################################

# somatic, indel
########################################################################
type="somatic"
subtype="indel"

dir=$HOME"/ind231/"$type"/"$subtype
echo $dir

cd $dir
#files=`ls *DIAGNOSIS_COMPLETE*`
files=`ls *DISCOVERY_COMPLETE*`
head=$type"_"$subtype

output=$outdir"/"$outfile"_"$type"_"$subtype".csv"

echo "SA_ID,"$head > $output
for file in $files
	do
	no=`cat $file | awk -F"," '{print $26}' | sort -u | wc -l`
	SA=`echo $file | awk -F"_" '{print $3}' | awk -F"." '{print $1}'`
	mut=`cat $file | awk -F"," '{print $4":"$5"_"$26}'`
	echo $SA","$mut >> $output
	done

########################################################################

# somatic, snv
########################################################################
type="somatic"
subtype="snv"

dir=$HOME"/ind231/"$type"/"$subtype
echo $dir

cd $dir
files=`ls *DIAGNOSIS_COMPLETE*`
head=$type"_"$subtype

output=$outdir"/"$outfile"_"$type"_"$subtype".csv"

echo "SA_ID,"$head > $output
for file in $files
	do
	no=`cat $file | awk -F"," '{print $34}' | sort -u | wc -l`
	SA=`echo $file | awk -F"_" '{print $4}' | awk -F"." '{print $1}'`
	echo $SA","$no >> $output
	done

########################################################################




