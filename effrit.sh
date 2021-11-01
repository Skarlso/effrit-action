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
