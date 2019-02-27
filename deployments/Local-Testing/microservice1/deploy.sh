#!/bin/sh
export SUBSCRIPTION_ID="${YOUR_TEST_SUBSCRIPTION_ID}"
export REMOTE_BASE_URL="https://${SUBDOMAIN}.ngrok.io/"
export TEMPLATE_URL="${REMOTE_BASE_URL}/Services/microservice1.json"
export PARAMETERS_FILE="./parameters.json"
export DEPLOYMENT_NAME="${YOUR_DEPLOYMENT}"
export AZURE_LOCATION="${YOUR_AZ_DATA_CENTER}"

az account set -s "${SUBSCRIPTION_ID}"
az deployment create -n ${DEPLOYMENT_NAME} -l ${AZURE_LOCATION} --template-uri "${TEMPLATE_URL}" \
--parameters remoteBaseURL=${REMOTE_BASE_URL} rgName=${DEPLOYMENT_NAME} rgLocation=${AZURE_LOCATION} \
--parameters @${PARAMETERS_FILE} --debug