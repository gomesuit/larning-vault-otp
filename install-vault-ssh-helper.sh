#!/bin/sh

yum install -y wget unzip
wget https://releases.hashicorp.com/vault-ssh-helper/0.1.1/vault-ssh-helper_0.1.1_linux_amd64.zip
unzip -o vault-ssh-helper_0.1.1_linux_amd64.zip
cp -f vault-ssh-helper /usr/local/bin/


mkdir -p /etc/vault-ssh-helper.d

tee /etc/vault-ssh-helper.d/config.hcl <<-EOF
vault_addr="http://127.0.0.1:8200"
ssh_mount_point="ssh"
EOF

sed -e "/auth       substack     password-auth/d" /etc/pam.d/sshd
echo "auth requisite pam_exec.so quiet expose_authtok log=/tmp/vaultssh.log /usr/local/bin/vault-ssh-helper -config=/etc/vault-ssh-helper.d/config.hcl" >> /etc/pam.d/sshd
echo "auth optional pam_unix.so not_set_pass use_first_pass nodelay" >> /etc/pam.d/sshd

sed -i -e "s/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/g" /etc/ssh/sshd_config
sed -i -e "s/UsePAM no/UsePAM yes/g" /etc/ssh/sshd_config
sed -i -e "s/PasswordAuthentication yes/PasswordAuthentication no/g" /etc/ssh/sshd_config

systemctl restart sshd
