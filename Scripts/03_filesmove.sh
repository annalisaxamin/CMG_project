#!/bin/sh
#
# rename and move the gff files per sample
mkdir 02_roary_processingfiles
for file in *_out;
do frename=`echo $file | sed 's/\_out//'`  
mv $file/*.gff  $file/$frename.gff
cp $file/$frename.gff 02_roary_processingfiles/
done  
