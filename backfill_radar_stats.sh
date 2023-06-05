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

HOMEevs=/lfs/h2/emc/vpppg/save/logan.dawson/github_wkspc/cam_severe_stats_EVS

export VDATE=20230504
vhr=15
qsub -v cyc=$vhr ${HOMEevs}/ecf/cam/stats/jevs_hireswarw_radar_stats.ecf
qsub -v cyc=$vhr ${HOMEevs}/ecf/cam/stats/jevs_hireswarwmem2_radar_stats.ecf
qsub -v cyc=$vhr ${HOMEevs}/ecf/cam/stats/jevs_hireswfv3_radar_stats.ecf
qsub -v cyc=$vhr ${HOMEevs}/ecf/cam/stats/jevs_href_radar_stats.ecf
qsub -v cyc=$vhr ${HOMEevs}/ecf/cam/stats/jevs_hrrr_radar_stats.ecf
qsub -v cyc=$vhr ${HOMEevs}/ecf/cam/stats/jevs_namnest_radar_stats.ecf
qsub -v cyc=$vhr ${HOMEevs}/ecf/cam/stats/jevs_rrfs_radar_stats.ecf
sleep 10

vhr=17
qsub -v cyc=$vhr ${HOMEevs}/ecf/cam/stats/jevs_hireswarw_radar_stats.ecf
qsub -v cyc=$vhr ${HOMEevs}/ecf/cam/stats/jevs_hireswarwmem2_radar_stats.ecf
qsub -v cyc=$vhr ${HOMEevs}/ecf/cam/stats/jevs_hireswfv3_radar_stats.ecf
qsub -v cyc=$vhr ${HOMEevs}/ecf/cam/stats/jevs_href_radar_stats.ecf
qsub -v cyc=$vhr ${HOMEevs}/ecf/cam/stats/jevs_hrrr_radar_stats.ecf
qsub -v cyc=$vhr ${HOMEevs}/ecf/cam/stats/jevs_namnest_radar_stats.ecf
qsub -v cyc=$vhr ${HOMEevs}/ecf/cam/stats/jevs_rrfs_radar_stats.ecf
sleep 10

vhr=18
qsub -v cyc=$vhr ${HOMEevs}/ecf/cam/stats/jevs_hireswarw_radar_stats.ecf
qsub -v cyc=$vhr ${HOMEevs}/ecf/cam/stats/jevs_hireswarwmem2_radar_stats.ecf
qsub -v cyc=$vhr ${HOMEevs}/ecf/cam/stats/jevs_hireswfv3_radar_stats.ecf
qsub -v cyc=$vhr ${HOMEevs}/ecf/cam/stats/jevs_href_radar_stats.ecf
qsub -v cyc=$vhr ${HOMEevs}/ecf/cam/stats/jevs_hrrr_radar_stats.ecf
qsub -v cyc=$vhr ${HOMEevs}/ecf/cam/stats/jevs_namnest_radar_stats.ecf
qsub -v cyc=$vhr ${HOMEevs}/ecf/cam/stats/jevs_rrfs_radar_stats.ecf
sleep 10

vhr=19
qsub -v cyc=$vhr ${HOMEevs}/ecf/cam/stats/jevs_hireswarw_radar_stats.ecf
qsub -v cyc=$vhr ${HOMEevs}/ecf/cam/stats/jevs_hireswarwmem2_radar_stats.ecf
qsub -v cyc=$vhr ${HOMEevs}/ecf/cam/stats/jevs_hireswfv3_radar_stats.ecf
qsub -v cyc=$vhr ${HOMEevs}/ecf/cam/stats/jevs_href_radar_stats.ecf
qsub -v cyc=$vhr ${HOMEevs}/ecf/cam/stats/jevs_hrrr_radar_stats.ecf
qsub -v cyc=$vhr ${HOMEevs}/ecf/cam/stats/jevs_namnest_radar_stats.ecf
qsub -v cyc=$vhr ${HOMEevs}/ecf/cam/stats/jevs_rrfs_radar_stats.ecf
sleep 10

vhr=20
qsub -v cyc=$vhr ${HOMEevs}/ecf/cam/stats/jevs_hireswarw_radar_stats.ecf
qsub -v cyc=$vhr ${HOMEevs}/ecf/cam/stats/jevs_hireswarwmem2_radar_stats.ecf
qsub -v cyc=$vhr ${HOMEevs}/ecf/cam/stats/jevs_hireswfv3_radar_stats.ecf
qsub -v cyc=$vhr ${HOMEevs}/ecf/cam/stats/jevs_href_radar_stats.ecf
qsub -v cyc=$vhr ${HOMEevs}/ecf/cam/stats/jevs_hrrr_radar_stats.ecf
qsub -v cyc=$vhr ${HOMEevs}/ecf/cam/stats/jevs_namnest_radar_stats.ecf
qsub -v cyc=$vhr ${HOMEevs}/ecf/cam/stats/jevs_rrfs_radar_stats.ecf
sleep 10

exit
