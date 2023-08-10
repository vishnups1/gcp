Lab URL
- https://www.cloudskillsboost.google/games/4301/labs/27860̦

Enable APIs

```shell
gcloud services enable container.googleapis.com \
cloudbuild.googleapis.com \
sourcerepo.googleapis.com
```

Add K8s developer role to Cloud Build service account

```shell
gcloud projects add-iam-policy-binding $PROJECT_ID \
--member=serviceAccount:$(gcloud projects describe $PROJECT_ID --format="value(projectNumber)")@cloudbuild.gserviceaccount.com \
--role=roles/container.developer
```

Configure git CLI

```shell
git config --global user.email "foo@example.com"
git config --global user.name "foo"
```

Create artifact registry un us-central1 region

```shell
gcloud artifacts repositories create my-repository --repository-format=docker --location=us-central1
```

Create GKE cluster in zone `us-central1-a`, release channel `Regular`, cluster version `1.25.5-gke.2000`, cluster autoscaler enabled, min nodes `2`, max nodes `6` and number of nodes `3`

```shell
gcloud container clusters create my-cluster \
--zone=us-central1-a \
--release-channel=regular \
--cluster-version=1.25.5-gke.2000 \
--enable-autoscaling \
--min-nodes=2 \
--max-nodes=6 \
--num-nodes=3
```

Create a cloud build trigger named sample-app-prod-deploy listens for changes on the master branch and builds a Docker image of your application, pushes it to Google Artifact Registry, and deploys the latest version of the image to the prod namespace in your GKE cluster.

