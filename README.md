# Project Description

Cluster provided by **Civo Cloud** for Cloud Native Rioja.

## Architecture Diagram

![arch-diagram](assets/cluster-demos.png)

## Objective

The cluster provided by Civo Cloud will be used for developing applications and services for the Cloud Native Rioja community. It will be utilized for conducting proof of concepts, deploying applications and services, and for hosting workshops and events.

## Operation

The cluster currently consists of 3 nodes with 4GB RAM and 2 vCPUs each. Two workflows have been created on Github for deploying the infrastructure and installing additional applications.

## Deployment

Terraform has been used for deploying the infrastructure, which is responsible for creating the nodes and additional applications. A Github workflow has been created for this purpose, which runs upon pushing to the master branch.

## Configuration

For configuring the cluster, a file named `config.yaml` has been created, in which parameters are specified to dynamically change variables such as the quantity and type of nodes, cluster configuration software, cluster name, default applications to install, etc.

## Initial ArgoCD Installation

For manually installing ArgoCD (only done once, the application remains in the cluster-applications repository), the following commands need to be executed:

```bash
kubectl create namespace argocd
helm install argocd argo/argo-cd --version 5.46.6 -n argocd
```

# POWERED BY [CIVO CLOUD](https://www.civo.com/)
