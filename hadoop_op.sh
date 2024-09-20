#!/bin/bash

if [ $# -lt 1 ]
then
    echo "No Args Input..."
    exit ;
fi

case $1 in
"start")
    echo " ========== 启动 hadoop 集群 ========== "
    echo " ---------- 启动 hdfs ---------- "

    ssh hadoop102 "/opt/module/hadoop-3.1.3/sbin/start-dfs.sh"

    echo " ---------- 启动 yarn ----------"

    ssh hadoop103 "/opt/module/hadoop-3.1.3/sbin/start-yarn.sh"

    echo " ---------- 启动 historyserver ---------- "

    ssh hadoop102 "/opt/module/hadoop-3.1.3/bin/mapred --daemon start historyserver"
;;
"stop")
    echo " ========== 关闭 hadoop 集群 ========== "
    echo " ---------- 关闭 historyserver ----------"

    ssh hadoop102 "/opt/module/hadoop-3.1.3/bin/mapred --daemon stop historyserver"

    echo " ---------- 关闭 yarn  ----------"

    ssh hadoop103 "/opt/module/hadoop-3.1.3/sbin/stop-yarn.sh"

    echo " ---------- 关闭 hdfs  ---------- "

    ssh hadoop102 "/opt/module/hadoop-3.1.3/sbin/stop-dfs.sh"
;;
*)
    echo "Input Args Error..."
;;
esac
————————————————

                            版权声明：本文为博主原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接和本声明。
                        
原文链接：https://blog.csdn.net/weixin_41365204/article/details/142391490
