data "google_service_account" "myaccount" {
  account_id = var.service_account_id
}

resource "google_compute_instance" "vm" {
  name = var.vm_name
  machine_type = var.machine_type
  boot_disk {
    initialize_params {
      image = var.boot_disk.initialize_params.image
    }
  }

  network_interface {
    network = "default"
    # network = var.network_name
    # subnetwork = var.subnetwork_name
    access_config {
      
    }
  }

  allow_stopping_for_update = true

  labels = {
    "ansible_target" = "true"
    "action_runner" = "true"
  }

  metadata = {
    ssh-keys = "${var.ssh_user}:${file(var.ssh_pub_key_path)}"
  }

  service_account {
    email = data.google_service_account.myaccount.email
    scopes = [ "cloud-platform" ]
  }
}