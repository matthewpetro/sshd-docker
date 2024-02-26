#! /bin/bash

ssh-keygen -t ecdsa -b 256 -N "" -q -C "" -f ssh_host_ecdsa_key
ssh-keygen -t ed25519 -N "" -q -C "" -f ssh_host_ed25519_key
ssh-keygen -t rsa -b 2048 -N "" -q -C "" -f ssh_host_rsa_key

export SSH_HOST_ECDSA_KEY=$(cat ./ssh_host_ecdsa_key | tr -d '\n' | base64 -w 0)
export SSH_HOST_ECDSA_KEY_PUB=$(cat ./ssh_host_ecdsa_key.pub | tr -d '\n' | base64 -w 0)
export SSH_HOST_ED25519_KEY=$(cat ./ssh_host_ed25519_key | tr -d '\n' | base64 -w 0)
export SSH_HOST_ED25519_KEY_PUB=$(cat ./ssh_host_ed25519_key.pub | tr -d '\n' | base64 -w 0)
export SSH_HOST_RSA_KEY=$(cat ./ssh_host_rsa_key | tr -d '\n' | base64 -w 0)
export SSH_HOST_RSA_KEY_PUB=$(cat ./ssh_host_rsa_key.pub | tr -d '\n' | base64 -w 0)

rm ssh_host_ecdsa_key* ssh_host_ed25519_key* ssh_host_rsa_key*

envsubst < deploy-container.yaml > deploy-container.tmp.yaml

az container create \
  --resource-group PetroRG \
  --file deploy-container.tmp.yaml

rm deploy-container.tmp.yaml
