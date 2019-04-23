FROM centos:centos7
MAINTAINER ChengGang <chenggangpro@gmail.com>
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo '$TZ' > /etc/timezone
RUN localedef -c -f UTF-8 -i zh_CN zh_CN.utf8
ENV LC_ALL zh_CN.utf8
RUN mkdir -p /opt/project /opt/logs
ADD jre-8u202-linux-x64.tar.gz /usr/local/
ENV JAVA_HOME /usr/local/jre1.8.0_202
ENV CLASSPATH $JAVA_HOME/lib/dt.jar;$JAVA_HOME/lib/tools.jar
ENV PATH $PATH:$JAVA_HOME/bin/