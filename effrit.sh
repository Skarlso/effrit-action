#!/usr/bin/env bash

echo "Welcome to Effrit...running checker."

# Gather input parameters
while getopts ":o:n:r:p:" opt; do
  case $opt in
    o) OWNER="$OPTARG"
    ;;
    n) PR_NUMBER="$OPTARG"
    ;;
    r) REPO="$OPTARG"
    ;;
    p) PROJECT_NAME="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    exit 1
    ;;
  esac

  case $OPTARG in
    -*) echo "Option $opt needs a valid argument"
    exit 1
    ;;
  esac
done

echo "REPO: ${REPO}; OWNER: ${OWNER}; PR_NUMBER: ${PR_NUMBER}; PROJECT_NAME: ${PROJECT_NAME}"
echo -n "Downloading latest effrit binary..."
mkdir -p /app
cd /app
curl -L https://github.com/Skarlso/effrit/releases/latest/download/effrit_linux_amd64.tar.gz | tar -xz
echo "done."
mv effrit /usr/local/bin
echo "Running Effrit PR checker..."
cd "${GITHUB_WORKSPACE}"
effrit check pr --owner "${OWNER}" --pr-number "${PR_NUMBER}" --project-name "${PROJECT_NAME}" --repo "${REPO}"
echo "done. Thank you for using Effrit"
