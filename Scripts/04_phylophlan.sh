#!/bin/sh
mkdir 03_phylophlan_input 
cp *.f*a 03_phylophlan_input
phylophlan_metagenomic -i 03_phylophlan_input -o 03_phylophlan_output --nproc 3 -n 1 \
-e .fa --database_update -d CMG2122 --verbose

