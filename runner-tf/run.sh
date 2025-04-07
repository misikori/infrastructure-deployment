#!/bin/sh

set -eux

terraform init
terraform plan
terraform apply -auto-approve

ansible-playbook -i inventory.gcp.yml playbook.yml
