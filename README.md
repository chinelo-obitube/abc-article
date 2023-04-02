# Project Structure
```
abc-article
├─ Dockerfile
├─ abc-architecture
|  ├─README.md
├─ README.md
├─ abc-article-api
├─ deployments
│  ├─ deployment.yaml
│  ├─ namespace.yaml
│  └─ service.yaml
└─ terraform
   ├─ gcr
   │  ├─ main.tf
   │  └─ provider.tf
   └─ gke
      ├─ .gitignore
      ├─ main.tf
      ├─ nat.tf
      ├─ nodepools.tf
      ├─ provider.tf
      ├─ router.tf
      ├─ subnets.tf
      └─ vpc.tf
```
# Docker

1. Cd into abc-article-api folder. 
2. Build the docker image using this command `docker build -t devops/article-api:latest .`
3. Run the application: `docker run -p 8080:8080 devops/article-api:latest`.
4. To run in a detachable mood `docker run -p 8080:8080 devops/article-api:latest -d ` .

# Terraform 

## Create a container registry on GCP using terraform

1. Cd into terraform/gcr folder.
2. Run `terraform init` to  initialize the directory.
3. Run `terraform plan` to confirm what terraform is creating.
4. Run `terraform apply -auto-approve` to create the container registry.
5. Confirm the container registry has created.


## Push the image to container registry

1. Authenticate docker to be able to push from local to remote registry `gcloud auth configure-docker`.
2. Tag the image `docker tag devops/article-api:latest gcr.io/my-bitnami-hosting/article-api`.
3. Push the image to the created registry `docker push gcr.io/my-bitnami-hosting/article-api`.
4. Check that the image has been successfully pushed to the container registry.

# Kubernetes Deployment
## Create GKE cluster to deploy the API

1. CD into terraform/gcr folder.
2. run `terraform init` to  initialize the directory.
3. Run `terraform plan` to confirm what terraform is creating.
4. Run `terraform apply -auto-approve` to create the kubernetes cluster
5. Confirm the cluster has been created and confirm by running the command `kubectl get nodes`.

## Create the deployment manifests and deploy the API
1. Run the command :`gcloud container clusters get-credentials abctech --zone europe-west2-a --project my-bitnami-hosting` to configure the cluster on the command line
2. Cd into deployments folder.
3. Create the namespace using `kubectl apply -f namespace.yaml`.
4. Create the deployment using ```kubectl apply -f deployment.yaml```.
5. Create the service using `kubectl apply -f service.yaml`.
6. Run `kubectl get pods -n dev` to confirm the pods are running.
7. Confirm the service is up and the APi is exposed on http://35.242.128.238:8080.

Extra steps
1. Increase the replica to 2 to handle traffic.
2. CI/CD to automate the deployment process with cloudrun.

