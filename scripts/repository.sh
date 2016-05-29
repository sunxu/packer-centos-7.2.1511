#!/bin/sh -eux

\mv /tmp/repo /opt
\cp /etc/yum.repos.d/CentOS-Base.repo{,.bak}
\cp /opt/repo/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo

RC_LOCAL="/etc/rc.d/rc.local"
REPO_RUN="python /opt/repo/reposerver.py &> /tmp/yum.repo.server.log &"
echo "$REPO_RUN" >> $RC_LOCAL
chmod +x $RC_LOCAL

reboot
sleep 60
