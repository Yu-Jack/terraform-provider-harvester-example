# Storage classes for encryption
resource "harvester_storageclass" "encryption" {
  name = "encryption"

  parameters = {
    "migratable"                                       = "true"
    "numberOfReplicas"                                 = "1"
    "staleReplicaTimeout"                              = "30"
    "encrypted"                                        = "true"
    "csi.storage.k8s.io/node-publish-secret-name"      = kubernetes_secret_v1.crypto_default.metadata[0].name
    "csi.storage.k8s.io/node-publish-secret-namespace" = kubernetes_secret_v1.crypto_default.metadata[0].namespace
    "csi.storage.k8s.io/node-stage-secret-name"        = kubernetes_secret_v1.crypto_default.metadata[0].name
    "csi.storage.k8s.io/node-stage-secret-namespace"   = kubernetes_secret_v1.crypto_default.metadata[0].namespace
    "csi.storage.k8s.io/provisioner-secret-name"       = kubernetes_secret_v1.crypto_default.metadata[0].name
    "csi.storage.k8s.io/provisioner-secret-namespace"  = kubernetes_secret_v1.crypto_default.metadata[0].namespace
  }
}
