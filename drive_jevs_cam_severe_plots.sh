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

qsub -v cyc=$vhr ${HOMEevs}/dev/drivers/scripts/cam/plots/jevs_cam_radar_plots.sh

exit
