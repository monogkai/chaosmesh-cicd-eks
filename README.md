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

## Chaos Experiments

Chaos Mesh experiments included:

| Type         | Description                                |
|--------------|--------------------------------------------|
| `PodKill`    | Terminates selected pods randomly          |

You can find the experiments under the `chaos/` folder.

## Prerequisites

- AWS account with ECR and EKS permissions
- GitHub repository with secrets and variables set:
-- AWS_ACCESS_KEY_ID
-- AWS_SECRET_ACCESS_KEY
-- AWS_REGION
-- ACCOUNT_ID