# Main configuration - Entry point for the Terraform configuration
# This file can be used for global configurations or as an entry point
# All resources have been moved to their respective modules:
# - secrets.tf: Kubernetes secrets for encryption
# - storage.tf: Storage classes
# - images.tf: VM images (basic and encrypted)
# - cloud_init.tf: Cloud-init configurations
# - virtual_machines.tf: Virtual machine definitions

# You can add global variables, outputs, or other configurations here