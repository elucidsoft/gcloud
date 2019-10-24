#!/bin/sh
set -e

gcloud config set project "$GCLOUD_PROJECT"
gcloud container clusters get-credentials "$K8S_CLUSTER_NAME" --zone "$GCLOUD_ZONE"
