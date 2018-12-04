#!/bin/sh

#日志文件路径
#app_log_file=/data/software/script/log/test.log

#应用路径
app_jar_path=/data/software/manqian-mcollect-schedule

#脚本路径
app_bat_path=/data/software/script

psid=0

checkpid(){
        thriftps=`ps -ef | grep "${app_jar_path}/classes" | grep -v grep`
        if [ -n "$thriftps" ]; then
                psid=`echo $thriftps | awk '{print $2}'`
        else
                psid=0
        fi
}

checkpid

if [ $psid = 0 ]; then
         sh ${app_jar_path}/platform_service.sh >> ${app_bat_path}/log/runlog.log
        checkpid
fi

echo "manqian-mcollect-schedule started in "`date  +%Y%m%d%H%M`  $psid >> ${app_bapath}/log/run.log