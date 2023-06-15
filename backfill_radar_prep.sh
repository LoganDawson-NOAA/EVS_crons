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

export VDATE=20230612
vhrs="11 12 13 14 15 16 17 18 19 20 21 22 23"
for vhr in $vhrs; do
   qsub -v cyc=$vhr /lfs/h2/emc/vpppg/save/logan.dawson/EVS/ecf/scripts/cam/prep/jevs_cam_radar_prep.ecf
   sleep 3
done

exit

qsub -v cyc=$vhr /lfs/h2/emc/vpppg/save/logan.dawson/EVS/ecf/scripts/cam/prep/jevs_cam_radar_prep.ecf
sleep 3

