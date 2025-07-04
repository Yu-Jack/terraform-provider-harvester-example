# Local variables for image configurations
locals {
  ubuntu_images = {
    "ubuntu20a" = {
      name         = "ubuntu20a"
      display_name = "ubuntu20a"
    }
    "ubuntu20b" = {
      name         = "ubuntu20b"
      display_name = "ubuntu20b"
    }
    "ubuntu20c" = {
      name         = "ubuntu20c"
      display_name = "ubuntu20c"
    }
  }
}

# Basic Ubuntu image for VM
resource "harvester_image" "ubuntu20" {
  name      = "ubuntu-focal"
  namespace = var.default_namespace

  display_name = "ubuntu-focal"
  source_type  = "download"
  url          = var.ubuntu_image_url
}

# Source images for encryption (using for_each)
resource "harvester_image" "ubuntu_sources" {
  for_each = local.ubuntu_images

  name      = each.value.name
  namespace = var.harvester_public_namespace

  display_name = each.value.display_name
  source_type  = "download"
  url          = var.ubuntu_image_url
}

# Encrypted images (using for_each)
resource "harvester_image" "encrypted_images" {
  for_each = local.ubuntu_images

  namespace          = var.default_namespace
  name              = "encrypted-${each.value.name}"
  display_name      = "encrypted-${each.value.name}"
  source_type       = "clone"
  storage_class_name = harvester_storageclass.encryption.name

  security_parameters = {
    crypto_operation        = "encrypt"
    source_image_name       = harvester_image.ubuntu_sources[each.key].name
    source_image_namespace  = harvester_image.ubuntu_sources[each.key].namespace
  }
}

# Decrypted image example
resource "harvester_image" "decrypted_image" {
  namespace        = var.default_namespace
  name            = "decrypted-ubuntu"
  display_name    = "decrypted-ubuntu"
  source_type     = "clone"

  security_parameters = {
    crypto_operation        = "decrypt"
    source_image_name       = harvester_image.encrypted_images["ubuntu20a"].name
    source_image_namespace  = harvester_image.encrypted_images["ubuntu20a"].namespace
  }
}
