# GitHub Action for Google Cloud

The GitHub Actions for [Google Cloud Platform](https://cloud.google.com/) and wraps the [kubectl](https://kubernetes.io/docs/reference/kubectl/overview/) to operate your kubernetes cluster. This is a thin wrapper around the `kubectl` utility.

## Usage
An example workflow to list kubernetes pods on Google Cloud Platform:

```
workflow "Run gcloud command" {
  on = "push"
  resolves = "Load credentials"
}

action "GCP Authenticate" {
  uses = "actions/gcloud/auth@master"
  secrets = ["GCLOUD_AUTH"]
}

action "Set kubectl config" {
  needs = ["GCP Authenticate"]
  uses = "actions/gcloud/kubectl-config@master"
  env = {
    GCLOUD_ZONE = "your-gcp-region"
    GCLOUD_PROJECT = "your-gcp-project"
    K8S_CLUSTER_NAME = "your-gke-cluster"
  }
}

action "GCP List Clusters" {
  needs = ["Set kubectl config"]
  uses = "actions/gcloud/kubectl@master"
  args = "get pod"
}
```

For more information about the authentication step, [see `auth`](/auth).
For more information about the kubectl settings step, [see `kubectl-config`](/kubectl-config).

## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE).

Container images built with this project include third party materials. See [THIRD_PARTY_NOTICE.md](THIRD_PARTY_NOTICE.md) for details.
