resource "harvester_image" "ubuntu20" {
   name      = "ubuntu-focal"
   namespace = "default"

   display_name = "ubuntu-focal"
   source_type  = "download"
   url          = "https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img"
 }

resource "harvester_cloudinit_secret" "cloud-config-ubuntu20" {
  name      = "cloud-config-ubuntu20"
  namespace = "default"

  user_data    = <<-EOF
    #cloud-config
    password: test
    chpasswd:
      expire: false
    ssh_pwauth: true
    package_update: true
    packages:
      - qemu-guest-agent
    runcmd:
      - - systemctl
        - enable
        - '--now'
        - qemu-guest-agent
    EOF
  network_data = ""
}

resource "harvester_virtualmachine" "ubuntu20" {
  name                 = "ubuntu20"
  namespace            = "default"
  restart_after_update = true

  description = "test ubuntu20 raw image"
  tags = {
    ssh-user = "ubuntu"
  }

  cpu    = 1
  memory = "2Gi"

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
    size       = "10Gi"
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