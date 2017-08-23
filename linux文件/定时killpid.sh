username=user
pidname=vi
count=0
while true ;do
pid=$(pgrep -u $username $pidname) # ps ax| grep '/sbin/dhclient' | grep -v 'grep' | awk '{print $1}'
for i in $pid ;do
        echo "wait 5 second"
        sleep 5
        start_time=$(ps -o start_time $i  |tail -n 1 |xargs -i date -d {} +%s) #获取pid的开始时间（时分）并且转化为时分秒
        cur_time=$(date +%s)  #当前时间（时分秒）
        if [ $(( cur_time - start_time )) -ge 60 ] ;then
                echo "found " $pidname "process"
                #echo "found [vi] process  [ $i ] started at " $(date -d "1970-01-01 $start_time sec utc") ",kill it"
                /bin/kill $i
                if ps $i >/dev/null ;then
                        /bin/kill -9 $i
			
                fi

        fi
done
pid=$(pgrep -u $username $pidname)
count=$[count+1]
if [ ! $pid ];then
	echo "no pid and run " $count " times"
	break
fi
done