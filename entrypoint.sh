#!/bin/bash
  
#parse cmd arguments
while getopts p:i:v:e: flag
do
    case "${flag}" in
        p) playbook=${OPTARG};;
        i) inventory=${OPTARG};;
        v) vault_pass=${OPTARG};;
        e) extra_vars=${OPTARG};;
    esac
done

CMD="ansible-playbook"

#check for playbook
if [ ! -z $playbook ]
then
   CMD="${CMD} ${playbook}"
fi

#check for inventory 
if [ ! -z $inventory ]
then
   CMD="${CMD} --inventory ${inventory}"
fi

#check for vault_pass 
if [ ! -z $vault_pass ]
then
   echo ${vault_pass} > .vaultpass
   CMD="${CMD} --vault-password-file .vaultpass"
fi

#check for extra_vars 
if [ ! -z $extra_vars ]
then
   CMD="${CMD} --extra-vars ${extra_vars}"
fi

#run the command
${CMD}
