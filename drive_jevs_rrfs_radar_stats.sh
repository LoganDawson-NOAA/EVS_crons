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

models="rrfs"

for model in ${models}; do

   qsub -v cyc=$vhr /lfs/h2/emc/vpppg/save/logan.dawson/github_wkspc/radar_svr_stats_EVS/ecf/scripts/cam/stats/jevs_${model}_radar_stats.ecf

   sleep 60

done

exit

