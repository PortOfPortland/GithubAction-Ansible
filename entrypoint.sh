#!/bin/bash
  
#arguments
playbook=$1
inventory=$2
vault_pass=$3
extra_vars=$4

CMD="ansible-playbook ${playbook} --inventory ${inventory}"

#check for vault_pass - default if nothing is specified is "none"
if [ ! $vault_pass == "none" ]
then
   echo ${vault_pass} > .vaultpass
   CMD="${CMD} --vault-password-file .vaultpass"
fi

#check for extra_vars - default if nothing is specified is "none"
if [ ! $extra_vars == "none" ]
then
   CMD="${CMD} --extra-vars ${extra_vars}"
fi

#run the command
${CMD}
