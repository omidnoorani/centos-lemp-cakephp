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

sleep 20 # Fast execution of the ssh command will fail

echo "running command:"
echo "gcutil --project=$1 ssh --ssh_arg=\"-t\" $2 \"curl -s https://raw.github.com/Label305/centos-lemp-cakephp/master/google_compute_engine/bootstrap/bootstrap.sh | sudo bash\""

gcutil --project=$1 ssh --ssh_arg="-t" $2 "curl -s https://raw.github.com/Label305/centos-lemp-cakephp/master/google_compute_engine/bootstrap/bootstrap.sh | sudo bash"
