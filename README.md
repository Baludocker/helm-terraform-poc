# nginx-terraform-poc

This repository contains Infrastructure as Code (IaC) and Kubernetes configurations to:

- Provision a Rocky Linux instance or GKE cluster using **Terraform**
- Deploy a web server using **Helm**
- Automate deployments with **GitHub Actions**

---

## 🚀 Overview

- **Terraform**: Used to provision infrastructure on Google Cloud Platform (GCP)
- **Helm**: Used to deploy an NGINX application on GKE
- **GitHub Actions**: Automates CI/CD deployment pipeline

---

## 📁 Directory Structure

### 🧭 Helm Chart Structure

```
nginx-chart/
├── Chart.yaml           # Chart metadata (apiversion, name, version)
├── values.yaml          # Default configuration values
└── templates/
    ├── deployment.yaml  # Kubernetes Deployment template
    └── service.yaml     # Kubernetes Service template
```

### ⚙️ GitHub Actions Workflow

```
.github/
└── workflows/
    └── pod-helm-cicd.yaml  # GitHub Actions workflow to deploy Helm chart
```

### 🌍 Terraform Structure

```
terraform/
├── main.tf           # Core resources (Compute Engine or GKE cluster)
├── variables.tf      # Input variables (machine type, zone, VPC, subnet)
├── outputs.tf        # Output values (instance IP, name, zone)
├── provider.tf       # GCP provider configuration
└── README.md         # Terraform-specific documentation (optional)
```

---

## 🧪 How It Works

1. **Terraform** provisions GCP infrastructure:
   - Rocky Linux VM or Kubernetes cluster (based on configuration)

2. **Helm** deploys the NGINX server into the GKE cluster using the Helm chart under `nginx-chart/`.

3. **GitHub Actions** automatically deploys the Helm chart on push to `main` branch.

---

## 🛠️ Prerequisites

- [Terraform]
- [Google Cloud SDK]
- [Helm]
- A GCP project configured with service account
- Kubernetes cluster (via Terraform or manually created)

---

## ⚙️ Usage

### 🔨 Terraform

```bash
cd terraform/
terraform init
terraform plan
terraform apply
```

This will create infrastructure and print outputs like instance IP or GKE cluster details.

---

### 📦 Helm Deployment

To deploy using Helm:

```bash
helm install nginx-poc ./nginx-chart --namespace poc-test #Modify as per env
```

Make sure your `kubectl` context is set to the right GKE cluster so that we can see resources in cluster.

---

### 🤖 GitHub Actions

The file `.github/workflows/pod-helm-cicd.yaml`:

- Triggers on push to `main`
- Builds and deploys using Helm to GKE including image build and push to artifact

---

## 🧾 Outputs

- Terraform output:
  - VM external IP (for Rocky Linux)
  - GKE cluster info
- Helm output:
  - LoadBalancer IP to access NGINX pod as svc



