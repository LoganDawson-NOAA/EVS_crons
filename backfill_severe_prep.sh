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

export VDATE=20230607
export REP_DATE=20230606
export OTLK_DATE=20230613

qsub -v cyc=00 ${HOMEevs}/dev/drivers/scripts/cam/prep/jevs_cam_severe_prep.sh

exit


