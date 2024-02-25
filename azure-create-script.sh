#! /bin/bash

# This script expects the following command line arguments:
#   -d <path to the ECDSA private key file>
#   -e <path to the ED25519 private key file>
#   -r <path to the RSA private key file>

# The script also expects that the corresponding public key files are in the same directory
# as the private key files and that the public key files have the same name as the private key
# files, but with a .pub extension.

while getopts ":d:e:r:" opt; do
  case $opt in
    d) ecdsa_key_file=$OPTARG;;
    e) ed25519_key_file=$OPTARG;;
    r) rsa_key_file=$OPTARG;;
    :) echo "Option -$OPTARG requires an argument.";;
    ?) echo "Invalid option -$OPTARG";;
  esac
done

SSH_HOST_ECDSA_KEY=$(cat $ecdsa_key_file | tr -d '\n')
SSH_HOST_ECDSA_KEY_PUB=$(cat ${ecdsa_key_file}.pub | tr -d '\n')
SSH_HOST_ED25519_KEY=$(cat $ed25519_key_file | tr -d '\n')
SSH_HOST_ED25519_KEY_PUB=$(cat ${ed25519_key_file}.pub | tr -d '\n')
SSH_HOST_RSA_KEY=$(cat $rsa_key_file | tr -d '\n')
SSH_HOST_RSA_KEY_PUB=$(cat ${rsa_key_file}.pub | tr -d '\n')

az container create
  --resource-group PetroRG
  --file deploy-container.yaml
  # --name sshd-docker2
  # --image ghcr.io/matthewpetro/sshd-docker:latest
  # --dns-name-label sshd-docker2
  # --ports 8080
  --secrets-mount-path /mnt/keys
  --secrets
    ssh_host_ecdsa_key=$SSH_HOST_ECDSA_KEY
    ssh_host_ecdsa_key.pub=$SSH_HOST_ECDSA_KEY_PUB
    ssh_host_ed25519_key=$SSH_HOST_ED25519_KEY
    ssh_host_ed25519_key.pub=$SSH_HOST_ED25519_KEY_PUB
    ssh_host_rsa_key=$SSH_HOST_RSA_KEY
    ssh_host_rsa_key.pub=$SSH_HOST_RSA_KEY_PUB
