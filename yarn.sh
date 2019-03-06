#!/usr/bin/env bash
curl --silent --location https://rpm.nodesource.com/setup_6.x | bash -

curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | tee /etc/yum.repos.d/yarn.repo

yum install yarn -y

yarn --version