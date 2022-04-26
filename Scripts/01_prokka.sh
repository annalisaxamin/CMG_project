#!/bin/sh
#1. activate conda with: conda activate prokka
# go to folder path for all the files
#
#2. Run prokka 
#
for file in *.f*a; 
do echo $file "being processed"
outfile=`echo $file | sed 's/\.fna/_out/g;s/\.fa/_out/g'` 
echo "output folder is" $outfile
prokka --kingdom Bacteria --outdir $outfile --locustag L --cpus 3 --prefix MAG $file --quiet
echo $file "processing completed"
echo " "
done
#
#3.deactivate conda :conda deactivate 
