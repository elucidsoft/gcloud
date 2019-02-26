# GitHub Action for Google Cloud

The GitHub Actions for [Google Cloud Platform](https://cloud.google.com/) and wraps the [gcloud SDK](https://cloud.google.com/sdk/) for setting kubectl configs. This is a thin wrapper around the `gcloud config` command, setting your project and kubernetes credential using [Environment variables](https://developer.github.com/actions/creating-github-actions/accessing-the-runtime-environment/#environment-variables).

## Usage
An example workflow to list clusters on Google Cloud Platform:

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
    GCLOUD_PROJCT = "your-gcp-project"
    K8S_CLUSTER_NAME = "your-gke-cluster"
  }
}
```

For more information about the authentication step, [see `auth`](/auth).

## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE).

Container images built with this project include third party materials. See [THIRD_PARTY_NOTICE.md](THIRD_PARTY_NOTICE.md) for details.
