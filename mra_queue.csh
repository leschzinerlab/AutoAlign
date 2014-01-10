#!/bin/csh 
#$ -N MRA
#$ -S /bin/tcsh
#$ -cwd
#$ -V
#$ -pe ompi 39

set input=$1
set output=$2
set refs=$3
set bandpass=$4
set filt_str=$5

echo '$input'
echo '$output'
echo '$refs'
echo '$bandpass'
echo '$filter_str'

setenv IMAGIC_BATCH 1
echo "! "
echo "! "
echo "! ====================== "
echo "! IMAGIC ACCUMULATE FILE "
echo "! ====================== "
echo "! "
echo "! "
echo "! IMAGIC program: mralign ----------------------------------------------"
echo "! "
mpirun -np $NSLOTS -x DYLD_LIBRARY_PATH -x IMAGIC_BATCH  /programs/local/i386-mac/imagic/081126S/align/mralign.e_mpi <<EOF
YES
$NSLOTS
FRESH
ALL_REFERENCES
ROTATION_FIRST
CCF
$input
$output
$bandpass
$refs
NO_FILTER
NO
0.2
0.2
-180,180
-180,180
LOW
0.0,0.7
5
NO
EOF

touch MRA_is_done
