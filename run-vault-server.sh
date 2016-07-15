#!/bin/sh

mkdir -p /etc/vault

tee /etc/vault/config.hcl <<-EOF
backend "consul" {
  address = "127.0.0.1:8500"
  path = "vault"
}

listener "tcp" {
  address = "0.0.0.0:8200"
  tls_disable = 1
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


#openssl genrsa -out shared_key.pem 2048
tee /root/shared_key.pem <<-EOF
-----BEGIN RSA PRIVATE KEY-----
MIIEpgIBAAKCAQEA9jOPPneqsTzvLlw1tbT63NJ/dwBW/Fe0Mv++ck9aVW3kgZ0X
7623NaiKZ3K19RFQvGQTS1J1fzLEu+Ou/Sp9g+yQRLJlDnnN8nLzIwbrQDLLY0H2
r55ATfIJZOYUNgmEd4hULHxsItSqVJGZppZh1qXq7p9oHaTDrenXm5bjTFniWUo4
CmvBzYlCiE1XwHLnUjtyJ05Rv2j2PqHOGrE6WaYPsyHR68wNOR6X8+M0NMCqiIXv
2DJFbMFCPIaxXx7Qi6GQ7OEn6rbCfB9pCJjhjSQ26FKQJDjCzxGfUZc9MBwa87Gd
+j7qNB2HPy52jcko0+jGZbQWfhth7P3FzzCUBQIDAQABAoIBAQCeUkmrQgjiMO0e
Qu3HC7rGhhaxz+YgH8YhhZRSrfTJOwHW186ssmk+eEOIgpvAHIJuo2xE46HrShp5
ONEuvEQ6scWUZ6PUyz9EyebQf4KIpiFkkuavyHRRq3OfDtWwai5lL6XxdZGUVG20
NG06UzpXbhrFmHy7k1jCXb3or/86+M9SMITIaNTFhEljz0uaB3s+suUPWfF9MCNH
XepPAzB2i2249/k6tq6gftdl1DEp/Q5WjHATMSuK6xMiyo1H7BUoaNW6Fl8pWmzC
chvvQt19khqyeDXVk8AGSkuXiyC9RwEGRSZoXq75lLs780HD2PQg5W5knYk4g4qH
Ne2EmBOBAoGBAPvt7Zzp7pZsjLTHPuHnHru05lpQGM1AnoMPfqTQmuF6v39H5+P5
8+z/NSm/hmDhF1kvZgk44TXT1fgNZ1hFs/DKU+xZZXenaN4YD7wQaEvbKDPKajvW
GE1sR0X5sDIbq5OqN5S+mqbkRsscvhjtIRuwv6E5NTZEWx1iMndaGQ+HAoGBAPot
8DI0O64cN7/a9CAR+OBZ/ZlI7ZdndIfXE08dffSbq3JDV/Kw0wPmcMTew7U1cij9
/dgLxhYJIk+8pV+YlURR72Ebq73fCuQFZ4u41C0dk60sLUjAwOLb08PaY359v0Ne
CylrCivWt4HpyTY445Soi5qE3dgfPNj769YrMWsTAoGBAPIJ4SPETIkQuQ5l7rAy
0IAeiMFz+qAX2TKpjE7kbCj9OUYb21pYJlYnyvfVHlGtcDUrKKjrkNOaNhQfLI7O
SNaqTH7iVG3k1QerrlJMoSdf4vv/GJlsU+TuhntgLDu4AdvYyZWKmiKFZs51St2/
1PM5mKJYyBrfCXrtgPbSBQm5AoGBANudG+9WPtV2W9IFKKxGWozHMoEurbJs1LSy
LncS0pC5XmUtjLS0WGhiD7giPPaDdjVZ0U2n+Dk7x2zrktg6Hz4cFuDN45MHio3j
2KOkmk0IW6x2zUHCQxBiHKEewpw1UoKWuYGgPwuArxJR4ZnBkrXaxsHbxMqFkWqA
quQUgosVAoGBAIkUO2qCzUZEsgTtPwen04mtODxwFAerIoamAXqATUUD1RAAcJpi
pAaGtq3zS2c3xb9WFqllpC1e8aNh8h5xdePzpLkhCGIeT2KgrJ+iC/c0GwaCd85x
U2ogq3mk/XG98p83XKbC8NYz2ufVyi13wVMnY0k5Ia6SFUvgItCK0S7Y
-----END RSA PRIVATE KEY-----
EOF
