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

LINE_TYPES="nbrcnt nbrctc"

for x in ${LINE_TYPES}; do

   echo "submitting jevs_cam_radar_plots.sh for ${x} linetype at $now"
   qsub -v cyc=$vhr,LINE_TYPE=$x ${HOMEevs}/dev/drivers/scripts/cam/plots/jevs_cam_radar_plots.sh
   sleep 5

done

exit

