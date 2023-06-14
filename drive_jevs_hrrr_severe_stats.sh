#!/bin/bash
# Author: L.C. Dawson
#
###########################################################
# Called on a cron to run EVS jobs                        #
###########################################################

now=`date -u +%Y%m%d%H`

mkdir -p /lfs/h2/emc/ptmp/${USER}/cron.out
cd /lfs/h2/emc/ptmp/${USER}/cron.out

module reset

vhr=12

qsub -v cyc=$vhr /lfs/h2/emc/vpppg/save/logan.dawson/github_wkspc/radar_svr_stats_EVS/ecf/scripts/cam/stats/jevs_hrrr_severe_stats.ecf

exit

