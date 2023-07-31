#!/bin/bash
# Author: L.C. Dawson
#
###########################################################
# Called on a cron to run EVS jobs                        #
###########################################################

now=`date -u +%Y%m%d%H`
vhr=`echo $now | cut -c 9-10`

mkdir -p /lfs/h2/emc/ptmp/${USER}/cron.out
cd /lfs/h2/emc/ptmp/${USER}/cron.out

module reset

HOMEevs=/lfs/h2/emc/vpppg/save/${USER}/EVS

models="hireswarw hireswarwmem2 hireswfv3 href hrrr namnest rrfs"


export VDATE=20230711
vhrs="00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23"
vhrs="20"

for vhr in $vhrs; do
   for model in ${models}; do

      qsub -v cyc=$vhr ${HOMEevs}/dev/drivers/scripts/cam/stats/jevs_${model}_radar_stats.sh
      sleep 5


   done
   sleep 15
done


exit
