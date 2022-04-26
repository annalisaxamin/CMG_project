#!/bin/sh
# 1.calculate the number of CDS per  sample 
#
echo "SAMPLES\tTYPE\tCDS_COUNTS" > CDS_COUNTS_PER_SAMPLE.txt
#
for file in *_out;
do
samplename=`echo $file | sed 's/\_out//'`
cds=`cat $file/MAG.txt | grep "CDS" | cut -f1 -d " " | sed 's/\://'`
cdscounts=`cat $file/MAG.txt | grep "CDS" | cut -f2 -d " "` 
echo "$samplename\t$cds\t$cdscounts" >> CDS_COUNTS_PER_SAMPLE.txt
done
#
# 2.calculate the number of hypothetical proteins
# 
echo "SAMPLES\tHYPOTHETICAL_PROTEINS_COUNTS" > HYPOTHETICAL_PROTEINS_PER_SAMPLE.txt
for file in *_out;
do 
samplename=`echo $file | sed 's/\_out//'`
hp_count=`cat $file/MAG.tsv | grep -c "hypothetical"`
echo "$samplename\t$hp_count" >> HYPOTHETICAL_PROTEINS_PER_SAMPLE.txt
done

# 3. calculate the number of known proteins
# 
echo "SAMPLE\tKNOWN_PROTEINS_COUNTS" > KNOWN_PROTEINS_PER_SAMPLE.txt
for file in *_out;
do 
samplename=`echo $file | sed 's/\_out//'`
kp_count=`cat $file/MAG.tsv | grep -c -v "hypothetical"`
echo "$samplename\t$kp_count" >> KNOWN_PROTEINS_PER_SAMPLE.txt
done

