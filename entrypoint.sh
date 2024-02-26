#!/bin/sh
cp /mnt/keys/ssh_host_ecdsa_key /etc/ssh
chmod 600 /etc/ssh/ssh_host_ecdsa_key

cp /mnt/keys/ssh_host_ecdsa_key.pub /etc/ssh
chmod 644 /etc/ssh/ssh_host_ecdsa_key.pub

cp /mnt/keys/ssh_host_ed25519_key /etc/ssh
chmod 600 /etc/ssh/ssh_host_ed25519_key

cp /mnt/keys/ssh_host_ed25519_key.pub /etc/ssh
chmod 644 /etc/ssh/ssh_host_ed25519_key.pub

cp /mnt/keys/ssh_host_rsa_key /etc/ssh
chmod 600 /etc/ssh/ssh_host_rsa_key

cp /mnt/keys/ssh_host_rsa_key.pub /etc/ssh
chmod 644 /etc/ssh/ssh_host_rsa_key.pub

exec /usr/sbin/sshd -D -e "$@"