#!/bin/bash
# Author: L.C. Dawson
#
###########################################################
# Called on a cron to run EVS jobs                        #
###########################################################

set -x

now=`date -u +%Y%m%d%H`
hh=`echo $now | cut -c 9-10`

PDYm1=`$NDATE -24 ${now} | cut -c 1-8`

mkdir -p /lfs/h2/emc/ptmp/${USER}/cron.out
cd /lfs/h2/emc/ptmp/${USER}/cron.out


HOMEevs=/lfs/h2/emc/vpppg/save/${USER}/EVS


if [ $hh -lt 06 ]; then

   vhr=00
   models="hrrr namnest hireswarw hireswarwmem2 hireswfv3 rrfs href"

elif [ $hh -ge 06 ] && [ $hh -lt 12 ]; then

   vhr=06
   models="hrrr namnest rrfs"

elif [ $hh -ge 12 ] && [ $hh -lt 18 ]; then

   vhr=12
   models="hrrr namnest hireswarw hireswarwmem2 hireswfv3 rrfs href"

elif [ $hh -ge 18 ]; then

   vhr=18
   models="hrrr namnest rrfs"

else
   echo "cyc will not be defined correctly. Exiting."
   exit
fi


for model in ${models}; do

   echo "submitting jevs_${model}_severe_prep.sh for ${vhr}Z $PDYm1 cycle"
   qsub -v cyc=$vhr ${HOMEevs}/dev/drivers/scripts/cam/prep/jevs_${model}_severe_prep.sh

   sleep 60

done

exit

