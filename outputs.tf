# Outputs for the Terraform configuration

output "ubuntu_vm_id" {
  description = "ID of the Ubuntu virtual machine"
  value       = harvester_virtualmachine.ubuntu20.id
}

output "ubuntu_image_id" {
  description = "ID of the Ubuntu image"
  value       = harvester_image.ubuntu20.id
}

# output "encrypted_images" {
#   description = "Map of encrypted image IDs"
#   value       = { for k, v in harvester_image.encrypted_images : k => v.id }
# }

# output "decrypted_image_id" {
#   description = "ID of the decrypted image"
#   value       = harvester_image.decrypted_image.id
# }

output "storage_class_name" {
  description = "Name of the encryption storage class"
  value       = harvester_storageclass.encryption.name
}

output "cloud_init_secret_name" {
  description = "Name of the cloud-init secret"
  value       = harvester_cloudinit_secret.cloud-config-ubuntu20.name
}

# Cluster network outputs
output "mgmt_cluster_network_id" {
  description = "ID of the management cluster network"
  value       = data.harvester_clusternetwork.mgmt.id
}

output "mgmt_cluster_network_name" {
  description = "Name of the management cluster network"
  value       = data.harvester_clusternetwork.mgmt.name
}

output "mgmt_cluster_network_state" {
  description = "State of the management cluster network"
  value       = data.harvester_clusternetwork.mgmt.state
}
