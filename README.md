# SSHD in Docker

A minimal SSHD installation inside a Docker container

## Usage
This container is intended to be used as an SSH jump server.

## Create script
The `azure-create-script.sh` can be run on any machine with a bash shell and the Azure CLI installed.
The script will create new SSH host keys and put those in a secret volume which will be mounted
to the container. This avoids the need to either keep the host keys in the container itself or
regenerate them every time the container starts.

## Helpful links
[Mount secret volume to Azure Container Instance](https://learn.microsoft.com/en-us/azure/container-instances/container-instances-volume-secret)

[YAML reference for creating Azure Container group](https://learn.microsoft.com/en-us/azure/container-instances/container-instances-reference-yaml?source=recommendations)

[Understand the DNS name reuse policy for Azure Container Instances](https://learn.microsoft.com/en-us/azure/container-instances/how-to-reuse-dns-names#understand-the-dns-name-reuse-policy)

[Pull request for change to YAML for DNS name reuse policy](https://github.com/Azure/azure-sdk-for-go/pull/18957)