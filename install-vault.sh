#!/bin/sh

yum install -y wget unzip
wget https://releases.hashicorp.com/vault/0.6.0/vault_0.6.0_linux_amd64.zip
unzip -o vault_0.6.0_linux_amd64.zip
cp -f vault /usr/local/bin/
