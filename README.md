# larning-vault-otp


```
openssl genrsa -aes128 2048 > server.key
openssl req -new -key server.key > server.csr
openssl x509 -in server.csr -days 365000 -req -signkey server.key > server.crt
```


```

sed -i -e "/auth       substack     password-auth/d" /etc/pam.d/sshd
echo "auth requisite pam_exec.so quiet expose_authtok log=/tmp/vaultssh.log /usr/local/bin/vault-ssh-helper -config=/etc/vault-ssh-helper.d/config.hcl" >> /etc/pam.d/sshd
echo "auth optional pam_unix.so not_set_pass use_first_pass nodelay" >> /etc/pam.d/sshd

sed -i -e "s/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/g" /etc/ssh/sshd_config
sed -i -e "s/UsePAM no/UsePAM yes/g" /etc/ssh/sshd_config
sed -i -e "s/PasswordAuthentication yes/PasswordAuthentication no/g" /etc/ssh/sshd_config

systemctl restart sshd


export VAULT_ADDR='https://127.0.0.1:8200'

vault init -key-shares=1 -key-threshold=1
vault unseal
vault auth

vault mount ssh

vault write ssh/roles/otp_key_role \
     key_type=otp \
     default_user=vagrant \
     cidr_list=127.0.0.0/8,192.168.33.0/24

vault write ssh/creds/otp_key_role ip=192.168.33.10

ssh vagrant@192.168.33.10

```

## v0.1.1以降https通信でないとOTPが使えない仕様になっているので諦める
https://github.com/hashicorp/vault-ssh-helper/blob/v0.1.1/main.go
