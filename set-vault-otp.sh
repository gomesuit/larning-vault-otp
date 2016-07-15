#!/bin/sh

export VAULT_ADDR='http://127.0.0.1:8200'

/usr/local/bin/vault init

#vault unseal
#vault unseal
#vault unseal

#/usr/local/bin/vault mount ssh

#/usr/local/bin/vault write ssh/roles/otp_key_role \
#    key_type=otp \
#    default_user=vagrant \
#    cidr_list=127.0.0.0/8,192.168.33.0/24

#/usr/local/bin/vault token-create
