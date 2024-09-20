#!/bin/bash

# 检查是否至少有一个参数传递给脚本
if [ "$#" -lt 1 ]; then
    echo "Not Enough Argument!"
    exit 1 # 通常使用非零值来表示异常退出
fi

# 遍历所有集群中的机器
for host in hadoop102 hadoop103 hadoop104
do
	echo "=================== $host ==================="
	# 遍历所有目录，挨个发送
	for file in $@
	do
		if [ -e $file ]; then
			# 获取父目录
			pdir=$(cd -P $(dirname $file); pwd)
			# 获取当前文件名称
			fname=$(basename $file)
			ssh $host "mkdir -p $pdir"
			rsync -av $pdir/$fname $host:$pdir
		else
        	echo  "$file does not exists"
		fi
	done
	
done
