#!/bin/bash

die () {
  echo >&2 "$@"
  exit 1
}

if [ "$#" -lt 2 ]; then
  die "2 argument required, $# provided. [GCE PROJECT] [GCE INSTANCE NAME] [INSTANCETYPE (optional)] [ZONE (optional)] [INSTANCE SPECIFIC DEPLOY HQ KEY (optional)]"
fi

if [ "$#" -lt 3 ]; then
  INSTANCETYPE="f1-micro"
else
  INSTANCETYPE=$3
fi

if [ "$#" -lt 4 ]; then
  ZONE="europe-west1-b"
else
  ZONE=$4
fi

echo "
Are you sure you wish to create $2 in the $1 project?
Instance type: $INSTANCETYPE
Zone: $ZONE

Make sure you have set the required metakeys in the $1 project before running this script.
 * newrelic-license
 * deploy-hq-key
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

if [ "$#" -lt 5 ]; then
  gcutil --project=$1 \
    addinstance $2 \
    --image=centos-6 \
    --persistent_boot_disk \
    --zone=$ZONE \
    --machine_type=$INSTANCETYPE
else
  echo "Setting up with custom deploy-hq-key."
  gcutil --project=$1 \
    addinstance $2 \
    --image=centos-6 \
    --persistent_boot_disk \
    --zone=$ZONE \
    --machine_type=$INSTANCETYPE \
    --metadata=deploy-hq-key:"$5"
fi


sleep 30 # Fast execution of the ssh command will fail

echo "running command:"
echo "gcutil --project=$1 ssh --ssh_arg=\"-t\" $2 \"curl -s https://raw.githubusercontent.com/Label305/centos-lemp-cakephp/master/google_compute_engine/bootstrap/bootstrap.sh | sudo bash\""

gcutil --project=$1 ssh --ssh_arg="-t" $2 "curl -s https://raw.githubusercontent.com/Label305/centos-lemp-cakephp/master/google_compute_engine/bootstrap/bootstrap.sh | sudo bash"
