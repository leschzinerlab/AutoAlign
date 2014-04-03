#!/bin/csh 
#$ -N pretreat
#$ -S /bin/tcsh
#$ -cwd
#$ -V
#$ -pe ompi 2

set input=$1


setenv IMAGIC_BATCH 1
echo "! "
echo "! "
echo "! ====================== "
echo "! IMAGIC ACCUMULATE FILE "
echo "! ====================== "
echo "! "
echo "! "
echo "! IMAGIC program: alimass ----------------------------------------------"
echo "! "
/programs/local/i386-mac/imagic/081126S/align/alimass.e <<EOF
NO
$input
${input}_center
TOTSUM
CCF
0.7
0.15
NO
EOF
echo "! "
echo "! IMAGIC program: alirefs ----------------------------------------------"
echo "! "
/programs/local/i386-mac/imagic/081126S/align/alirefs.e <<EOF
ALL
CCF
5
${input}_center
NO
0.9
${input}_center_prep
-999.
0.3
-180,180
NO
NO
EOF
echo "! "
echo "! IMAGIC program: arithm -----------------------------------------------"
echo "! "
/programs/local/i386-mac/imagic/081126S/stand/arithm.e <<EOF
${input}_center_prep
${input}_center_prep_mask
SOFT
0.6
0.2
EOF
echo "! "
echo "! IMAGIC program: pretreat ---------------------------------------------"
echo "! "
/programs/local/i386-mac/imagic/081126S/stand/pretreat.e <<EOF
${input}_center_prep_mask
${input}_center_prep_mask_norm
NORM_VARIANACE
WHOLE
10.0
10
EOF

touch pretreat_is_done
