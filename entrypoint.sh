#!/bin/sh
#cp /mnt/keys/* /etc/ssh
ssh-keygen -A
chmod 600 /etc/ssh/ssh_host_*_key
chmod 644 /etc/ssh/ssh_host_*_key.pub
exec /usr/sbin/sshd -D -e "$@"