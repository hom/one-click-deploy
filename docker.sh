#!/usr/bin/env bash

yum remove docker \
  docker-client \
  docker-client-latest \
  docker-common \
  docker-latest \
  docker-latest-logrotate \
  docker-logrotate \
  docker-engine

yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

yum-config-manager \
  --add-repo \
  https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo

yum makecache fast

yum install -y docker-ce

file=/etc/docker/daemon.json
if [ -f $file]; then
  echo "file exists"
else
  echo "file dont exist\n"
  touch /etc/docker/daemon.json
fi

cat > /etc/docker/daemon.json <<-EOF
{
  "registry-mirrors": ["https://registry.docker-cn.com"]
}
EOF

systemctl restart docker