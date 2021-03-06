#!/bin/bash
####################################
##
## This bash script is run on the OpsManager node itself to configure Opsman and the director
## Note: The configure_authentication shell script is required to be run before this script runs
##
######################

set -e
## Setup OM environment vars
source ~/.om_profile

echo "Preparing to configure BOSH Director..."

if [ -f "/home/ubuntu/vm_extensions.txt" ]; then
  vm_extensions=$(cat /home/ubuntu/vm_extensions.txt | tr -d '[:space:]')
  
  if [ ! -z "${vm_extensions}" ]; then
    rm -f vm-extension*
    
    csplit --digits=2  --quiet --prefix=vm-extension --suppress-matched /home/ubuntu/vm_extensions.txt "/|/" "{*}"
    
    shopt -s nullglob
    for f in vm-extension*
    do
        echo "Applying VM extension $f"
        om -k create-vm-extension --config $f
    done
  fi
fi

echo 'Configuring OpsMan....'
om -k configure-opsman -c /home/ubuntu/config/ops-manager.yml --vars-file /home/ubuntu/config/director-config-vars.yml


echo 'Configuring BOSH Director....'
om -k configure-director -c /home/ubuntu/config/director.yml --ops-file /home/ubuntu/config/director-config-ops.yml --vars-file /home/ubuntu/config/director-config-vars.yml



om -k apply-changes -n p-bosh