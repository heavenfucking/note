#!/bin/sh

#删除10天前的日志
#find /data/log/task_schedule/ -mtime +10 -name "*log*" -exec rm -rf {} \;

#auto_del_log.sh "/data/log/task_schedule/" 10
find $s1 -mtime +$s2 -name "*log*" -exec rm -rf {} \;