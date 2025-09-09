# Infrastructure Deployment – Capstone Project

**Overview**  
High-level summary: this repo contains the full infrastructure-as-code stack for my project, including CI/CD pipelines, Terraform configurations, Ansible automation, and application deployment via Helm.

##  Contents

- **`.github/workflows/`**  
  CI/CD pipelines that automate infrastructure deployment and configuration.

- **`core-tf/`**  
  Terraform modules and configurations for backbone infrastructure with support for multiple environments.

- **`runner-tf/`**  
  Terraform configuration for provisioning GitHub Actions self-hosted runner and following Ansible playbook.

- **`charts/petclinic-app/`**  
  Helm chart for deploying the PetClinic application.

![Architecture Diagram](/diagram.png)

---
