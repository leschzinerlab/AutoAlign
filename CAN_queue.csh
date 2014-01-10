#!/bin/csh 
#$ -N CAN
#$ -S /bin/tcsh
#$ -cwd
#$ -V
#$ -pe ompi 1

set input=$1
set classums=$2
set numIters=$3
set directLearning=$4
set indirectLearning=$5
set maxage=$6
set nodes=$7

# To submit:  qsub ../CAN_submit.csh ../current_mra classsums${i} $numIters 0.01 0.0005 25 $nodes

../CAN $input $classums $numIters $directLearning $indirectLearning $maxage $nodes

touch CAN_is_done
