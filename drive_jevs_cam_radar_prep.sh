#!/bin/bash
# Author: L.C. Dawson
#
###########################################################
# Called on a cron to run EVS jobs                        #
###########################################################

now=`date -u +%Y%m%d%H`
vhr=`echo $now | cut -c 9-10`

cd /lfs/h2/emc/ptmp/logan.dawson/cron.out
module reset

vhr=11
qsub -v cyc=$vhr /lfs/h2/emc/vpppg/save/logan.dawson/EVS/ecf/cam/prep/jevs_cam_radar_prep.ecf
sleep 5

vhr=12
qsub -v cyc=$vhr /lfs/h2/emc/vpppg/save/logan.dawson/EVS/ecf/cam/prep/jevs_cam_radar_prep.ecf
sleep 5

vhr=13
qsub -v cyc=$vhr /lfs/h2/emc/vpppg/save/logan.dawson/EVS/ecf/cam/prep/jevs_cam_radar_prep.ecf

exit

