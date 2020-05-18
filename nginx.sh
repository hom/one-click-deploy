#!/usr/bin/env bash

if [[ -f /etc/redhat-release ]]; then
    release="centos"
    systemPackage="yum"
elif grep -Eqi "debian|raspbian" /etc/issue; then
    release="debian"
    systemPackage="apt"
elif grep -Eqi "ubuntu" /etc/issue; then
    release="ubuntu"
    systemPackage="apt"
elif grep -Eqi "centos|red hat|redhat" /etc/issue; then
    release="centos"
    systemPackage="yum"
elif grep -Eqi "debian|raspbian" /proc/version; then
    release="debian"
    systemPackage="apt"
elif grep -Eqi "ubuntu" /proc/version; then
    release="ubuntu"
    systemPackage="apt"
elif grep -Eqi "centos|red hat|redhat" /proc/version; then
    release="centos"
    systemPackage="yum"
fi

echo "Install Nginx in $release for using package manager $systemPackage"

# install nginx in centos
sudo yum install -y yum-utils
touch /etc/yum.repos.d/nginx.repo

cat > /etc/yum.repos.d/nginx.repo <<-EOF
[nginx-stable]
name=nginx stable repo
baseurl=http://nginx.org/packages/centos/$releasever/$basearch/
gpgcheck=1
enabled=1
gpgkey=https://nginx.org/keys/nginx_signing.key
module_hotfixes=true

[nginx-mainline]
name=nginx mainline repo
baseurl=http://nginx.org/packages/mainline/centos/$releasever/$basearch/
gpgcheck=1
enabled=0
gpgkey=https://nginx.org/keys/nginx_signing.key
module_hotfixes=true
EOF

yum install nginx -y

nginx -v
