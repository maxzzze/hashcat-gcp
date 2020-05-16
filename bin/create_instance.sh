GRN='\033[0;32m'
RED='\033[0;31m'
PURPLE='\033[0;34m'
RST='\033[0m'

if [ $# -ne 1 ]
  then
    echo "Usage ./create_instance.sh INSTANCE_NAME GPU_TYPE (default: nvidia-tesla-k80) GPU_COUNT (default: 1) MACHINE_TYPE (default: n1-standard-4)"
        exit 1
fi


PROJECT_ID=$(gcloud config list project --format "value(core.project)")
INSTANCE_NAME=$1
GPU_TYPE=${2:-nvidia-tesla-k80}
GPU_COUNT=${3:-1}
MACHINE_TYPE=${4:-n1-standard-4}

echo "Creating an ${GRN}${MACHINE_TYPE}${RST} instance in ${GRN}${PROJECT_ID}${RST} GCP called in ${GRN}${INSTANCE_NAME}${RST} with the following GPUs ${GRN}${GPU_COUNT}${RST}:${GRN}${GPU_TYPE}${RST}"
echo "Continue? (y/n)"
read prompt

if [ "$prompt" == "y" ]
    then
        gcloud compute instances create $INSTANCE_NAME \
                --machine-type $MACHINE_TYPE \
                --zone europe-west1-b \
                --accelerator type=$GPU_TYPE,count=$GPU_COUNT \
                --image-family ubuntu-1604-lts \
                --image-project ubuntu-os-cloud \
                --maintenance-policy TERMINATE \
                --restart-on-failure
    else
        echo "Aborting..."
        exit 1
fi