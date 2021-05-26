#!/bin/bash

playbook=$1
inventory=$2
vault_pass=$3

echo $vault_pass > .vaultpass

ansible-playbook deploy.yml --vault-password-file .vaultpass 
