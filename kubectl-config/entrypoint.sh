#!/bin/sh
set -e

gcloud config set project "$GCLOUD_PROJECT"
gcloud config set container/use_client_certificate True
gcloud container clusters get-credentials "$K8S_CLUSTER_NAME" --zone "$GCLOUD_ZONE"
