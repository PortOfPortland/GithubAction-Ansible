#!/bin/bash

playbook=$1
inventory=$2
vault_pass=$3
extra_vars=$4

echo $vault_pass > .vaultpass

if [ ! -z ${extra_vars} ]
then
   ansible-playbook $playbook --inventory $inventory --vault-password-file .vaultpass --extra-vars $extra_vars 
else
   ansible-playbook $playbook --inventory $inventory --vault-password-file .vaultpass --extra-vars $extra_vars 
fi
