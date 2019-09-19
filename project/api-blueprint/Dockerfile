FROM centos:centos7
MAINTAINER ChengGang <chenggangpro@gmail.com>
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo '$TZ' > /etc/timezone
RUN localedef -c -f UTF-8 -i zh_CN zh_CN.utf8
ENV LC_ALL zh_CN.utf8
RUN yum install -y epel-release && yum update -y && yum install -y node npm make nginx git
RUN npm install -g aglio drakov

COPY scripts/startup.sh /usr/local/bin/
COPY scripts/deploy.sh /usr/local/bin/
COPY scripts/webhook.js /usr/local/bin/

RUN chmod -R 755 /usr/local/bin/*

CMD /usr/local/bin/deploy.sh && /usr/local/bin/startup.sh