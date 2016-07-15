#!/bin/sh

chmod 600 /root/shared_key.pem

useradd vaultadmin
mkdir -p /home/vaultadmin/.ssh
chown vaultadmin.vaultadmin /home/vaultadmin/.ssh
chmod 0700 /home/vaultadmin/.ssh
echo "vaultadmin   ALL=(ALL)NOPASSWD: ALL" >> /etc/sudoers

#ssh-keygen -f shared_key.pem -y | tee -a /home/vaultadmin/.ssh/authorized_keys
tee /home/vaultadmin/.ssh/authorized_keys <<-EOF
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD2M48+d6qxPO8uXDW1tPrc0n93AFb8V7Qy/75yT1pVbeSBnRfvrbc1qIpncrX1EVC8ZBNLUnV/MsS74679Kn2D7JBEsmUOec3ycvMjButAMstjQfavnkBN8glk5hQ2CYR3iFQsfGwi1KpUkZmmlmHWperun2gdpMOt6debluNMWeJZSjgKa8HNiUKITVfAcudSO3InTlG/aPY+oc4asTpZpg+zIdHrzA05Hpfz4zQ0wKqIhe/YMkVswUI8hrFfHtCLoZDs4SfqtsJ8H2kImOGNJDboUpAkOMLPEZ9Rlz0wHBrzsZ36Puo0HYc/LnaNySjT6MZltBZ+G2Hs/cXPMJQF
EOF

chown vaultadmin.vaultadmin /home/vaultadmin/.ssh/authorized_keys
chmod 0600 /home/vaultadmin/.ssh/authorized_keys

