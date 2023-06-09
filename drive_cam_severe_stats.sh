#!/bin/bash
# Author: L.C. Dawson
#
###########################################################
# Called on a cron to run EVS jobs                        #
###########################################################

set -x

now=`date -u +%Y%m%d%H`
vhr=`echo $now | cut -c 9-10`

mkdir -p /lfs/h2/emc/ptmp/${USER}/cron.out
cd /lfs/h2/emc/ptmp/${USER}/cron.out

module reset

HOMEevs=/lfs/h2/emc/vpppg/save/${USER}/EVS

models="hireswarw hireswarwmem2 hireswfv3 href hrrr namnest rrfs"

for model in ${models}; do

   qsub -v cyc=$vhr ${HOMEevs}/dev/drivers/scripts/cam/stats/jevs_${model}_severe_stats.sh

   sleep 60

done

exit

