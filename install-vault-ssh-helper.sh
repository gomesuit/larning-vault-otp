#!/bin/sh

yum install -y wget unzip
wget https://releases.hashicorp.com/vault-ssh-helper/0.1.1/vault-ssh-helper_0.1.1_linux_amd64.zip
unzip -o vault-ssh-helper_0.1.1_linux_amd64.zip
cp -f vault-ssh-helper /usr/local/bin/


mkdir -p /etc/vault-ssh-helper.d


tee /etc/vault-ssh-helper.d/vault.crt <<-EOF
-----BEGIN CERTIFICATE-----
MIIDADCCAegCCQCjVS+SngHIeTANBgkqhkiG9w0BAQUFADBCMQswCQYDVQQGEwJY
WDEVMBMGA1UEBwwMRGVmYXVsdCBDaXR5MRwwGgYDVQQKDBNEZWZhdWx0IENvbXBh
bnkgTHRkMB4XDTE2MDcxNjExMjc0NFoXDTI2MDcxNDExMjc0NFowQjELMAkGA1UE
BhMCWFgxFTATBgNVBAcMDERlZmF1bHQgQ2l0eTEcMBoGA1UECgwTRGVmYXVsdCBD
b21wYW55IEx0ZDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALxlJ6BV
FhAOMB460OsYBn5evwxGyQRJ2e+ZSf53xjxfFy67G5zTyM8VW869yt/Lv873Z0NI
K8hAv7GsHYoWJscmAybGgX7yeleqjZ6GfvT6+LiM1M112xxXNUX2Ie5mANZZZzk+
rvXNtxG+b/AyvNpD4zTqmR66VEHNVxGJVS570mYGRENx4h1w5GAN2tpZyIetS17B
HGfSvf8qRwF2dQ0Qh34BbchVx4sUQDWOuuFghe6cqaO+ZaZbtmSo+Iwmd1wwDTy1
jP8rkFnI+CNai6YAaBd2Pdhxn5bxRQr/EFPQvBWkRqaxSM5B8pvs8R2UbQwS1a25
me7fQElgts9XpkECAwEAATANBgkqhkiG9w0BAQUFAAOCAQEAo2yv/Kkc1DJ+zIC8
T6mH375wU0Sdh5uXOaXxkzTKEBJSxy4lrpssKAkQvL3vqS413Lp5xkEMX87UdeiQ
pU2sWd0Hfgp4Be0vBLHoxfRbm4PgKTwKSgsuw4znLa6sppG4yZ7uyTvZaEIEL6lr
x7hsvyHR/NKPz4UEs3Ja3Px08detnNk9emPXXrf/NvpL5s4hahM0akbFTh2/RkPB
GKx6hyMFh1SLXLmvoYs+hddNELcEEYKaZTV29pewsbQ3a/Q9G5wFyuYEwheNcjTX
fF9NZ8TPwFc2aKivlmD7JYftzDbmOxS24ZlkhRU5dEGMaE8Tj2rMC6GkloAsWc1V
FPq8dg==
-----END CERTIFICATE-----
EOF

tee /etc/vault-ssh-helper.d/config.hcl <<-EOF
vault_addr="https://127.0.0.1:8200"
ssh_mount_point="ssh"
ca_cert = "/etc/vault-ssh-helper.d/vault.crt"
EOF

