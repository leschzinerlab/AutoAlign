#!/bin/csh 
#$ -N MSA
#$ -S /bin/tcsh
#$ -cwd
#$ -V
#$ -pe ompi 30

set input=$1
set mask=$2
set eigenim=${input}_eigenim
set pixcoos=${input}_pixcoos
set eigenpix=${input}_eigenpix
set msa=${input}_msa

echo "! IMAGIC program: msa --------------------------------------------------"
echo "! "
mpirun -np $NSLOTS -x DYLD_LIBRARY_PATH -x IMAGIC_BATCH  /programs/local/i386-mac/imagic/081126S/msa/msa.e_mpi <<EOF
YES
$NSLOTS
FRESH_MSA
MODULATION
$input
NO
NO
$mask
$eigenim
$pixcoos
$eigenpix
50
69
0.8
$msa
EOF

touch test
touch MSA_is_done
