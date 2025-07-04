# Cloud-init configuration for Ubuntu VMs
resource "harvester_cloudinit_secret" "cloud-config-ubuntu20" {
  name      = "cloud-config-ubuntu20"
  namespace = var.default_namespace

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
