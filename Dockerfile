FROM centos:centos6
MAINTAINER Brian O'Connell <boconnell@pivotal.io>
ARG GPDB_PACKAGE
ENV GPDB_PACKAGE ${GPDB_PACKAGE}
RUN echo ${GPDB_PACKAGE}

RUN yum update -y && yum install -y openssh-server openssh-clients wget which lsof tar unzip nc ed sudo perl 

RUN echo "changeme"|passwd root --stdin

RUN useradd  gpadmin && echo "changeme"|passwd gpadmin --stdin

RUN chkconfig iptables off

RUN sed -i 's/^#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN  /etc/init.d/sshd start

COPY gpadmin/ /home/gpadmin/
RUN chown -R  gpadmin:gpadmin /home/gpadmin

RUN mkdir -p /data/master /data1/primary /data2/mirror /software 
RUN chown -R gpadmin:gpadmin /data/master /data1/primary /data2/mirror /software

EXPOSE 22 5432 28080
CMD    ["/usr/sbin/sshd", "-D"]
