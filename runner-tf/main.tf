module "runner" {
  source  = "./modules/compute"
  vm_name = var.vm_name
  ssh_pub_key_path = var.ssh_pub_key_path
  ssh_user = var.ssh_user
  service_account_id = var.service_account_id
}