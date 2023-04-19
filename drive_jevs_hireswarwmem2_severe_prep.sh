#!/bin/bash
# Author: L.C. Dawson
#
###########################################################
# Called on a cron to run EVS jobs                        #
###########################################################

now=`date -u +%Y%m%d%H`
hh=`echo $now | cut -c 9-10`

mkdir -p /lfs/h2/emc/ptmp/${USER}/cron.out
cd /lfs/h2/emc/ptmp/${USER}/cron.out

module reset

if [ $hh -lt 06 ]; then
   vhr=00
elif [ $hh -ge 06 ] && [ $hh -lt 12 ]; then
   vhr=06
elif [ $hh -ge 12 ] && [ $hh -lt 18 ]; then
   vhr=12
elif [ $hh -gt 18 ]; then
   vhr=18
fi

qsub -v cyc=$vhr /lfs/h2/emc/vpppg/save/logan.dawson/EVS/ecf/cam/prep/jevs_hireswarwmem2_severe_prep.ecf

exit

