#!/bin/bash
 
#pass the Google Compute Engine Project as first parameter
#pass the Google Compute Engine Instance name as seccond parameter
#pass the DeployHQ key as third parameter

  gcutil --project=$1 \
    addinstance $2 \
    --image=centos \
    --persistent_boot_disk \
    --zone=europe-west1-a \
    --machine_type=f1-micro \
    --metadata=deploy-hq-key:"$3"
  
  gcutil --project=$1 ssh --ssh_user=core $2 "bash <(curl -s https://raw.github.com/Label305/vagrant-centos/master/bootstrap-scripts/gce.sh)"