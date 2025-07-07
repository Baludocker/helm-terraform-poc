# nginx-terrafrom-poc
Code for deploying microservice resources in GKE using helm chart .

# helmchart and Github workflow
Deploy webserver using helmchart with github workflow under .github/workflows directory

##  Chart Structure

```
nginx-chart/
├── Chart.yaml         # Chart metadata (apiversion, name, version)
├── values.yaml        # Default configuration values
└── templates/
    ├── deployment.yaml  # k8s Deployment template
    └── service.yaml        # k8s svc template

# github workflow
.github/
└── workflows/
    └── pod-helm-cicd.yaml

# Terraform
Provision a rocky linux instance using Terraform with code in Terraform Directory

#  Terraform directory Structure

``` bash
terraform/
├── main.tf         # Core resources (Compute Engine instance)
├── variables.tf    # Input variables ( machine type, zone, vpc,subnet)
├── outputs.tf      # Output values ( instance IP,Name,Zone)
├── provider.tf     # GCP provider configuration
└── README.md       # Project documentation

