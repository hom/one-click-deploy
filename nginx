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

touch /etc/yum.repos.d/nginx.repo

cat > /etc/yum.repos.d/nginx.repo <<-EOF
[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/centos/7/\$basearch/
gpgcheck=0
enabled=1
EOF

yum install nginx -y

nginx -v
