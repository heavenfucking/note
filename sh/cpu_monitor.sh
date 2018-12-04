#!/bin/sh

function GetSysCPU
 {
   CpuIdle=`vmstat 1 5 |sed -n '3,$p' |awk '{x = x + $15} END {print x/5}' |awk -F. '{print $1}'`
   CpuNum=`echo "100-$CpuIdle" | bc`
   echo $CpuNum
 }

cpu=`GetSysCPU`

 echo `date  +%Y%m%d%H%M` "The system CPU is $cpu" >> log/cpu.log

 if [ $cpu -gt 92 ]
 then
 {
    echo "The usage of system cpu is larger than 96%"
    ps -ef | grep phantomjs | grep -v grep | cut -c 9-15 | xargs kill -9
 }
 else
 {
    echo "The usage of system cpu is normal"
 }
 fi