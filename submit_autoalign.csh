#!/bin/csh 
#$ -N auto_align
#$ -S /bin/tcsh
#$ -cwd
#$ -V
#$ -pe ompi 1

/labdata/allab/michaelc/Novartis/5mer+MSL/phase_flip/auto_align_queue 10 start_prep start_prep 3000 10 100 0.8 > log.log &

touch auto_align_is_done
