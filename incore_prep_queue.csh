#!/bin/csh 
#$ -N incore
#$ -S /bin/tcsh
#$ -cwd
#$ -V
#$ -pe ompi 4

set input=$1
set output=$2
set filt_strength=$3

setenv IMAGIC_BATCH 1
echo "! "
echo "! "
echo "! ====================== "
echo "! IMAGIC ACCUMULATE FILE "
echo "! ====================== "
echo "! "
echo "! "
echo "! IMAGIC program: incprep ----------------------------------------------"
echo "! "
mpirun -np $NSLOTS -x DYLD_LIBRARY_PATH -x IMAGIC_BATCH  /programs/local/i386-mac/imagic/081126S/incore/incprep.e_mpi <<EOF
YES
$NSLOTS
$input
$output
0.03
0.005
$filt_strength
0.7,0.2
10.0
NO
EOF

touch incore_prep_is_done
