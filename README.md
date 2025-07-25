# Chaos Engineering CI/CD Pipeline on AWS EKS

This project demonstrates a complete DevOps CI/CD pipeline with a primary focus on **Chaos Engineering** using [Chaos Mesh](https://chaos-mesh.org/). It integrates infrastructure provisioning, application deployment, observability, and chaos experimentation in a fully automated pipeline.

## Project Goals

- Deploy a containerized microservice to AWS EKS  
- Provision infrastructure with Terraform  
- Automate builds and deployments with GitHub Actions  
- Introduce chaos experiments using Chaos Mesh  
- Validate system resilience through automated checks  
- Monitor system behavior using Prometheus and Grafana

## Tech Stack

| Layer              | Technology              |
|-------------------|-------------------------|
| IaC               | Terraform               |
| CI/CD             | GitHub Actions          |
| Containerization  | Docker                  |
| Container Registry| Amazon ECR              |
| Orchestration     | Amazon EKS (Kubernetes) |
| Monitoring        | Prometheus, Grafana     |
| Chaos Engineering | Chaos Mesh              |
| Deployment Tool   | Helm                    |

## Project Structure

```plaintext
.
├── .github
│   ├── actions                  # Custom reusable composite actions
│   │   ├── cleanup-up           # Remove all resources
│   │   ├── setup                # Terraform apply (EKS, VPC, ECR)
│   │   ├── deploy               # Helm deployment + monitoring + chaos
│   │   ├── validate             # Verify deployment
│   │   └── chaos                # Chaos experiments and validate them
│   └── workflows
│       └── ci-cd-pipeline.yaml  # Main workflow trigger file
├── app                          # App source + Dockerfile
├── k8s
│   ├── templates
│   │   ├── deployment.yaml      # Kubernetes deployment manifest
│   │   └── service.yaml         # Kubernetes service manifest
│   └── Chart.yaml               # Helm chart definition
├── terraform
│   ├── vpc.tf                   # VPC module
│   ├── eks_cluster.tf           # EKS cluster definition
│   ├── eks_node_group.tf        # EKS managed node group
│   ├── iam.tf                   # IAM roles and policies
│   ├── provider.tf              # AWS provider configuration
│   ├── variables.tf             # Terraform variables
│   └── ecr.tf                   # ECR repository setup
├── chaos
│   └── pod-failure.yaml         # Kills one random pod
└── README.md                    # Project documentation
```

## Chaos Experiments

Chaos Mesh experiments included:

| Type         | Description                                |
|--------------|--------------------------------------------|
| `PodKill`    | Terminates selected pods randomly          |

You can find the experiments under the `chaos/` folder.

## Prerequisites

- An AWS account with programmatic access
- IAM role with EKS, ECR, VPC, EC2, and IAM permissions
- GitHub repository with secrets:
  - `AWS_ACCESS_KEY_ID`
  - `AWS_SECRET_ACCESS_KEY`
- GitHub repository with variables:
  - `AWS_REGION`
  - `ACCOUNT_ID`

## Setup Instructions

### 1. Clone the Repo

```bash
git clone https://github.com/your-username/chaos-cicd-pipeline.git
cd chaos-cicd-pipeline
```

### 2. Configure GitHub Secrets and Variables

Add the following values to repo Actions secrets and variables: `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, `AWS_REGION`, and `ACCOUNT_ID`.

### 3. Trigger the CI/CD

This project uses manual triggers for CI/CD workflows via GitHub Actions:

1. Go to your repository on GitHub.
2. Navigate to the **Actions** tab.
3. Select the `ci-cd-pipeline` workflow.
4. Click the **"Run workflow"** button to start the pipeline manually.

## CI/CD Pipeline Overview

The pipeline (`.github/workflows/ci-cd-pipeline.yaml`) executes the following steps in order:
1. Terraform Infra Setup
    - Provisions VPC, IAM roles, EKS cluster, ECR repo, etc.

2. Docker Image Build & Push
    - Builds app image and pushes to ECR

3. Helm Deploy to EKS
    - Deploys:
        - Javascript App
        - Prometheus
        - Grafana
        - Chaos Mesh

4. Run Chaos Experiments
    - Injects faults (e.g., Pod Kill)

5. Validate Chaos
    - Checks that system breaks
    - Ensures it recovers post-injection

6. Cleanup
    - Delete all resources