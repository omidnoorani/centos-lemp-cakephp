#!/bin/bash

die () {
    echo >&2 "$@"
    exit 1
}
 
[ "$#" -eq 3 ] || die "3 argument required, $# provided. [GCE PROJECT] [GCE INSTANCE NAME] [DEPLOY HQ KEY]"

echo "
Are you sure you wish to create $2 in the $1 project?

Make sure you have set the required metakeys in the $1 project before running this script.
 * newrelic-license
"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) break;;
        No ) exit;;
    esac
done

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
echo "gcutil --project=$1 ssh --ssh_arg=\"-t\" $2 \"curl -s https://raw.githubusercontent.com/Label305/centos-lemp-cakephp/master/google_compute_engine/bootstrap/bootstrap.sh | sudo bash\""

gcutil --project=$1 ssh --ssh_arg="-t" $2 "curl -s https://raw.githubusercontent.com/Label305/centos-lemp-cakephp/master/google_compute_engine/bootstrap/bootstrap.sh | sudo bash"
