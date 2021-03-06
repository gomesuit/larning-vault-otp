#!/bin/sh

BIND_ADDRESS=$1
echo $BIND_ADDRESS

mkdir -p /etc/vault

tee /etc/vault/server.crt <<-EOF
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

tee /etc/vault/server.key <<-EOF
-----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEAvGUnoFUWEA4wHjrQ6xgGfl6/DEbJBEnZ75lJ/nfGPF8XLrsb
nNPIzxVbzr3K38u/zvdnQ0gryEC/sawdihYmxyYDJsaBfvJ6V6qNnoZ+9Pr4uIzU
zXXbHFc1RfYh7mYA1llnOT6u9c23Eb5v8DK82kPjNOqZHrpUQc1XEYlVLnvSZgZE
Q3HiHXDkYA3a2lnIh61LXsEcZ9K9/ypHAXZ1DRCHfgFtyFXHixRANY664WCF7pyp
o75lplu2ZKj4jCZ3XDANPLWM/yuQWcj4I1qLpgBoF3Y92HGflvFFCv8QU9C8FaRG
prFIzkHym+zxHZRtDBLVrbmZ7t9ASWC2z1emQQIDAQABAoIBAF2DEEJDOapKgJPg
ueaXjFGZkdb0I78fMS/+tH280gcRZB5r/W7AqMIxZdqe1l5zcge3QehhoGnLydrV
BeyOxjy/n3zVt11d2mA9ZgIz3DyZfm+MZ+x7/YB5wRWy8HC27N94jQYbGRklPSNv
lXxyks78N4ECmXJpJn1rATbRJhjlvvgBT65pLjO76JCaBVzLKxTACtthcthGwFMR
zT1z+ZB/JPm7081rennSFtlYFpl0kcuoWKJevjrO1+DgABxP0c/e8GqEXJQoWNfH
J5yMlRIaITry5aBb46BxLqi1W4jaXGe+uEN8WX4xM09RQtdeMZkErG88Rj0bk51E
z9m0SukCgYEA5T/AfYgDLvtdUj+RBf/nOnUG8e5xIDswNu1FV/smLnX/JX1RbYA9
s8N3fEs+ptzPpazGI2UZI5kIZb5wX6qU7TMO75Fb21wwJNtnLZ9pKZuMWoXhgWeA
17TWTC3pp1cPACWikpxjOcYsDbL7eVWYydxZqp2Acoq1dwXpWGEKIqsCgYEA0mD+
ZqVT4Ae6W6YsOw7a8Gmp5NCecZuJi2pVHwED/rh+HTsO7bcT4C0QRVgaWDhKt007
bUbJpIFIx7AfP8dExy827acoV66vVAJ3Y+W60VgJ6Yxy8HMh0xpN2UKKBVMGWP/U
4KzjIkLBmSsTSlpBizzE4fBwo5xeqiPn1U5NusMCgYAbc87xOWBoN+Gs/7+2IDbo
YSs7vXn+ihfz++XZ61FfLvIm4yLlIf5BkJ62W6xc/wQ+qrnvcyPXh3Ph+zQpwJuk
7ABV3+pIEnoRb9SjOfu159Ke5HlkrahYLGedJ8JbL6m0Ms2NEP0w5fJQkaZbmUx6
n9B9Be9jyAiDAEo5MyWrkQKBgQCrLJhSVHrmceND5vVeKDwkGRVPRB9nOLK1aRNR
YrYpb1vN1NvUt33IjWILyh/FYCgK9SBBTbOL0lWxhLAoaK6hkt0SiUvd7BhkNo2G
Dsnuw79s9AYhdswyw9hLykQbCO7FQ4OmO4WjvsVfJxlPChkCfbOEUuqTdQvhS826
VTgRmQKBgQDSTlQpyKDseQMJSh+85g0/mYYLuTG/eIzC43xx2AKL6Y10v/7etVlJ
uQLw1cyMQ3b+VoyqTAQ4EzT41MgCZuorIFsaI/ki0Lvju2pRdMx7OsuAGCrjZG1O
Yx37l8ymBieIa0bicmnrl3gXUc5Xw0i6SCR/VVPMQp0Br/a+L5Oegw==
-----END RSA PRIVATE KEY-----
EOF

tee /etc/vault/config.hcl <<-EOF
backend "consul" {
  address = "127.0.0.1:8500"
  path = "vault"
}

listener "tcp" {
  address = "0.0.0.0:8200"
  tls_cert_file = "/etc/vault/server.crt"
  tls_key_file = "/etc/vault/server.key"
  tls_min_version = "tls12"
}
EOF

tee /etc/sysconfig/vault <<-EOF
GOMAXPROCS=2
OPTIONS=-config=/etc/vault/config.hcl
EOF

tee /etc/systemd/system/vault.service <<-EOF
[Unit]
Description=vault server
Requires=network-online.target
After=network-online.target

[Service]
EnvironmentFile=-/etc/sysconfig/vault
Environment=GOMAXPROCS=2
Restart=on-failure
ExecStart=/usr/local/bin/vault server \$OPTIONS
ExecReload=/bin/kill -HUP \$MAINPID
KillSignal=SIGINT

[Install]
WantedBy=multi-user.target

EOF

systemctl daemon-reload
systemctl enable vault
systemctl start vault

tee /etc/consul.d/vault.json <<-EOF
{
  "service": {
    "name": "vault",
    "address": "$BIND_ADDRESS",
    "port": 4647,
    "checks": [
      {
        "tcp": "$BIND_ADDRESS:8200",
        "interval": "10s"
      }
    ]
  }
}
EOF

/usr/local/bin/consul reload
