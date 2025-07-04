# Kubernetes secrets for encryption
resource "kubernetes_secret_v1" "crypto_default" {
  metadata {
    name      = "crypto"
    namespace = var.default_namespace
  }

  type = "Opaque"

  data = {
    CRYPTO_KEY_VALUE = var.encryption_passphrase
    CRYPTO_KEY_CIPHER = "aes-xts-plain64"
    CRYPTO_KEY_HASH = "sha256"
    CRYPTO_KEY_PROVIDER = "secret"
    CRYPTO_KEY_SIZE = 256
    CRYPTO_PBKDF = "argon2i"
  }
}
