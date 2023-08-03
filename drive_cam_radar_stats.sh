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

models="hireswarw hireswarwmem2 hireswfv3 href hrrr namnest"

for model in ${models}; do
   qsub -v cyc=$vhr ${HOMEevs}/dev/drivers/scripts/cam/stats/jevs_cam_${model}_radar_stats.sh
   sleep 30
done


exit

