#!/bin/sh

KEYS_DIR=/mnt/keys
SSH_DIR=/etc/ssh

cp $KEYS_DIR/ssh_host_ecdsa_key $SSH_DIR
chmod 600 $SSH_DIR/ssh_host_ecdsa_key

cp $KEYS_DIR/ssh_host_ecdsa_key.pub $SSH_DIR
chmod 644 $SSH_DIR/ssh_host_ecdsa_key.pub

cp $KEYS_DIR/ssh_host_ed25519_key $SSH_DIR
chmod 600 $SSH_DIR/ssh_host_ed25519_key

cp $KEYS_DIR/ssh_host_ed25519_key.pub $SSH_DIR
chmod 644 $SSH_DIR/ssh_host_ed25519_key.pub

cp $KEYS_DIR/ssh_host_rsa_key $SSH_DIR
chmod 600 $SSH_DIR/ssh_host_rsa_key

cp $KEYS_DIR/ssh_host_rsa_key.pub $SSH_DIR
chmod 644 $SSH_DIR/ssh_host_rsa_key.pub

exec /usr/sbin/sshd -D -e "$@"