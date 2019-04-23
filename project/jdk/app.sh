#!/bin/bash
source /etc/profile
JAR_PATH=/opt/project/$APP_NAME
JAVA_OPTS="-server -Xms$APP_MEMORY -Xmx$APP_MEMORY -XX:+UseConcMarkSweepGC -XX:CMSFullGCsBeforeCompaction=5 -Xloggc:/opt/logs/$APP_NAME/gc.log -verbose:gc -XX:+PrintGCDetails -XX:+PrintGCDateStamps -XX:+PrintGCTimeStamps -XX:+PrintGCApplicationConcurrentTime -XX:+PrintGCApplicationStoppedTime"
jar_pid()
{
  echo `ps -ef  | grep java | grep "$JAR_PATH" | grep -v grep | awk '{print $2}'`
}
stop()
{
                pid=$(jar_pid)
                if [ -n "$pid" ]; then
                        kill -9 $pid
                        [ $? -eq 0 ] && echo -e "\033[32m $JAR_PATH  has stop successfull\033[0m"
                else
                        echo -e "\e[00;31m $JAR_PATH is not running\e[00m"
                fi

}
start()
{               pid=$(jar_pid)
                if [ -n "$pid" ]; then
                        echo -e "\e[00;31m $JAR_PATH is already running (pid: $pid)\e[00m"
                else
                        `nohup java ${JAVA_OPTS} -jar ${JAR_PATH}/$APP_NAME.jar --spring.profiles.active=$APP_PROFILE  &>/dev/null &`
                        [ $? -eq 0 ] && echo -e "\033[32m $JAR_PATH  has start successfull\033[0m"
                fi
}
restart()
{
                stop
                start
}
case $1 in
    stop)
    stop
    ;;
    start)
    start
    ;;
    restart)
    restart
    ;;
    *)
    echo Usage: $0 "{start|stop|restart}"
    ;;
esac
