# Global variables for the Terraform configuration
variable "ssh_public_key" {
  description = "SSH public key for accessing the VM"
  type        = string
  default     = "your-ssh-public-key"
}

variable "ubuntu_image_url" {
  description = "URL for the Ubuntu image"
  type        = string
  default     = "https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img"
}

variable "default_namespace" {
  description = "Default namespace for resources"
  type        = string
  default     = "default"
}

variable "harvester_public_namespace" {
  description = "Harvester public namespace"
  type        = string
  default     = "harvester-public"
}

variable "vm_cpu" {
  description = "Default CPU count for VMs"
  type        = number
  default     = 1
}

variable "vm_memory" {
  description = "Default memory for VMs"
  type        = string
  default     = "2Gi"
}

variable "vm_disk_size" {
  description = "Default disk size for VMs"
  type        = string
  default     = "10Gi"
}

variable "encryption_passphrase" {
  description = "Encryption passphrase for encrypted images"
  type        = string
  default     = "your-encryption-passphrase-here"
  sensitive   = true
}
