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

HOMEevs=/lfs/h2/emc/vpppg/save/${USER}/EVS


# Get the number of arguments.
NARGS=$#
ARGS=("$@")

# Read report date from command line, if provided (YYYYMMDD)
if [[ ${NARGS} -eq 1 ]]; then
   export IDATE=$1
else
   export IDATE=20230620
fi
 
models="namnest hrrr hireswfv3 hireswarw hireswarwmem2 rrfs href"

for model in ${models}; do

   if [ $model = hrrr ] || [ $model = namnest ] || [ $model = rrfs ]; then
      hrs="00 06 12 18"
   else
      hrs="00 12"
   fi
   hrs="12"

   for hh in $hrs; do
      echo "submitting jevs_${model}_severe_prep.sh for ${hh}Z $IDATE cycle"
      qsub -v cyc=$hh ${HOMEevs}/dev/drivers/scripts/cam/prep/jevs_${model}_severe_prep.sh
      sleep 5
   done

 # sleep 30

done

exit


