#!/bin/bash

echo "grep -q 'nameserver 8.8.8.8' /etc/resolv.conf || echo 'nameserver 8.8.8.8' >> /etc/resolv.conf" >> /etc/rc.local
grep -q 'nameserver 8.8.8.8' /etc/resolv.conf || echo 'nameserver 8.8.8.8' >> /etc/resolv.conf
> /etc/yum.repos.d/CentOS-Base.repo

echo " 
# CentOS-EOL.repo
#
# This is an example config which can be used to deal with EOL RHEL
# You MUST look to mirroring this locally if you want long term access
#

[base]
name=CentOS-$releasever - Base
baseurl=http://archive.kernel.org/centos-vault/7.9.2009/os/$basearch/
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

#released updates
[updates]
name=CentOS-$releasever - Updates
baseurl=http://archive.kernel.org/centos-vault/7.9.2009/updates/$basearch/
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

#additional packages that may be useful
[extras]
name=CentOS-$releasever - Extras
baseurl=http://archive.kernel.org/centos-vault/7.9.2009/extras/$basearch/
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

#additional packages that extend functionality of existing packages
[centosplus]
name=CentOS-$releasever - Plus
baseurl=http://archive.kernel.org/centos-vault/7.9.2009/centosplus/$basearch/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
" >> /etc/yum.repos.d/CentOS-Base.repo

sed -i 's|name=CentOS-|name=CentOS-$releasever|g' /etc/yum.repos.d/CentOS-Base.repo
sed -i 's|baseurl=http://archive.kernel.org/centos-vault/.*./os//|baseurl=http://archive.kernel.org/centos-vault/7.9.2009/os/$basearch/|g' /etc/yum.repos.d/CentOS-Base.repo
sed -i 's|baseurl=http://archive.kernel.org/centos-vault/.*./updates//|baseurl=http://archive.kernel.org/centos-vault/7.9.2009/updates/$basearch/|g' /etc/yum.repos.d/CentOS-Base.repo
sed -i 's|baseurl=http://archive.kernel.org/centos-vault/.*./extras//|baseurl=http://archive.kernel.org/centos-vault/7.9.2009/extras/$basearch/|g' /etc/yum.repos.d/CentOS-Base.repo
sed -i 's|baseurl=http://archive.kernel.org/centos-vault/.*./centosplus//|baseurl=http://archive.kernel.org/centos-vault/7.9.2009/centosplus/$basearch/|g' /etc/yum.repos.d/CentOS-Base.repo
#sed -i "s/centos_version/${centosV}/g" /etc/yum.repos.d/CentOS-Base.repo






 yum clean all
 yum -y update
