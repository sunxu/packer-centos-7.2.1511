#!/bin/sh -eux

yum -y groups  install "Development Tools"
yum -y install kernel-headers kernel-devel
yum -y install bc 
yum -y install python perl python-devel
yum -y install glibc-static
yum -y install bind-utils
yum -y install net-tools
yum -y install traceroute
yum -y install tcpdump
yum -y install telnet nmap-ncat
yum -y install nfs-utils
yum -y install wget curl{,-devel}
yum -y install ltrace strace
yum -y install systemtap systemtap-sdt-devel
yum -y install time
yum -y install tmux
yum -y install vim-enhanced 
yum -y install libpcap{,-devel} -y
yum -y install {zlib,bzip2,xz}{,-devel}
yum -y install {ncurses,readline}{,-devel}
yum -y install openssl-devel
yum -y install sqlite-devel

