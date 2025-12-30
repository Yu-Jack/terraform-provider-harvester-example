resource "kubernetes_config_map" "testcloudinit" {
  metadata {
    name      = "testcloudinit"
    namespace = "default"
    labels = {
      "harvesterhci.io/cloud-init-template" = "user"
    }
  }

  data = {
    cloudInit = <<-EOF
      #cloud-config
      package_update: true
      password: 123
      chpasswd: {expire: False}
      ssh_pwauth: true
      packages:
        - qemu-guest-agent
      runcmd:
        - - systemctl
          - enable
          - --now
          - qemu-guest-agent.service
      ssh_authorized_keys:
        - ${var.ssh_public_key}
    EOF
  }
}