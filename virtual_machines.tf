# Virtual machines configuration
resource "harvester_virtualmachine" "ubuntu20" {
  name                 = "ubuntu20"
  namespace            = var.default_namespace
  restart_after_update = true

  description = "test ubuntu20 raw image"
  tags = {
    ssh-user = "ubuntu"
  }

  cpu    = var.vm_cpu
  memory = var.vm_memory

  run_strategy    = "RerunOnFailure"
  hostname        = "ubuntu20"
  reserved_memory = "100Mi"
  machine_type    = "q35"

  network_interface {
    name           = "nic-1"
    wait_for_lease = true
  }

  disk {
    name       = "rootdisk"
    type       = "disk"
    size       = var.vm_disk_size
    bus        = "virtio"
    boot_order = 1

    image       = harvester_image.ubuntu20.id
    auto_delete = true
  }

  cloudinit {
    user_data_secret_name    = harvester_cloudinit_secret.cloud-config-ubuntu20.name
    network_data_secret_name = harvester_cloudinit_secret.cloud-config-ubuntu20.name
  }
}
