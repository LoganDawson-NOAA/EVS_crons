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

HOMEevs=/lfs/h2/emc/vpppg/save/logan.dawson/EVS

export IDATE=20230603
 
models="namnest hrrr hireswfv3 hireswarw hireswarwmem2 rrfs href"

for model in ${models}; do

   if [ $model = hrrr ] || [ $model = namnest ] || [ $model = rrfs ]; then
      hrs="00 06 12 18"
   else
      hrs="00 12"
   fi

   for hh in $hrs; do
      qsub -v cyc=$hh ${HOMEevs}/ecf/scripts/cam/prep/jevs_${model}_severe_prep.ecf
      sleep 15
   done

   sleep 30

done

exit


