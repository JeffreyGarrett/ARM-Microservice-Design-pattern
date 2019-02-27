#!/bin/sh

# Notice that in the region deployment scripts there are more hardcoded values than in the local region.  this helps reduce errors or accidental overwrite
export REMOTE_BASE_URL="https://${SUB_DOMAIN}}.ngrok.io"  #this is used in order to host the files locally
export TEMPLATE_URL="${REMOTE_BASE_URL}/services/microservice1.json"
export DEPLOYMENT_TIME=$(date '+%Y%m%d%H%M%S') 

az cloud set --name AzureCloud
az account set -s "your subscription key"
az deployment create -n deploymentName-$DEPLOYMENT_TIME -l eastus --template-uri "${TEMPLATE_URL}" \
--parameters remoteBaseURL=${REMOTE_BASE_URL}  rgName="yourRGNAME" rgLocation="eastus" \
--parameters @./parameters.json --debug