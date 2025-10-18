#!/bin/bash

echo "grep -q 'nameserver 8.8.8.8' /etc/resolv.conf || echo 'nameserver 8.8.8.8' >> /etc/resolv.conf" >> /etc/rc.local
grep -q 'nameserver 8.8.8.8' /etc/resolv.conf || echo 'nameserver 8.8.8.8' >> /etc/resolv.conf
centosV=$(grep -oE '[0-9]+\.[0-9]+' /etc/redhat-release)

> /etc/yum.repos.d/CentOS-Base.repo

echo " 
[base]
name=CentOS-$releasever - Base
baseurl=http://archive.kernel.org/$centosV/os/$basearch/
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

[updates]
name=CentOS-$releasever - Updates
baseurl=http://archive.kernel.org/$centosV/updates/$basearch/
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

[extras]
name=CentOS-$releasever - Extras
baseurl=http://archive.kernel.org/$centosV/extras/$basearch/
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

[centosplus]
name=CentOS-$releasever - Plus
baseurl=http://archive.kernel.org/$centosV/centosplus/$basearch/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
" >> /etc/yum.repos.d/CentOS-Base.repo

sed -i 's|name=CentOS-|name=CentOS-$releasever|g' /etc/yum.repos.d/CentOS-Base.repo
sed -i 's|baseurl=http://archive.kernel.org/.*./os//|baseurl=http://archive.kernel.org/7.9.2009/os/$basearch/|g' /etc/yum.repos.d/CentOS-Base.repo
sed -i 's|baseurl=http://archive.kernel.org/.*./updates//|baseurl=http://archive.kernel.org/7.9.2009/updates/$basearch/|g' /etc/yum.repos.d/CentOS-Base.repo
sed -i 's|baseurl=http://archive.kernel.org/.*./extras//|baseurl=http://archive.kernel.org/7.9.2009/extras/$basearch/|g' /etc/yum.repos.d/CentOS-Base.repo
sed -i 's|baseurl=http://archive.kernel.org/.*./centosplus//|baseurl=http://archive.kernel.org/7.9.2009/centosplus/$basearch/|g' /etc/yum.repos.d/CentOS-Base.repo
#sed -i "s/centos_version/${centosV}/g" /etc/yum.repos.d/CentOS-Base.repo






 yum clean all
 yum -y update
