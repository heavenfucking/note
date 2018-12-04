#!bin/sh
logPathArr[0]="/data/log/task_schedule/"
logPathArr[1]="/data/log/collect/"
#logPathArr[2]="/data/log/task_schedule/"
#logPathArr[3]="/data/log/task_schedule/"
nowtime=`date --date='0 days ago' "+%Y-%m-%d %H:%M:%S"`
day=10
#遍历删除10天前的日志
for path in ${logPathArr[@]};
do
    find $path -mtime +$day -name "*log*" -exec rm -rf {} \;
    echo "${nowtime}: 清除 "${path}" 目录日志" >> /data/software/script/log/log_del.log
done