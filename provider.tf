terraform {
  required_providers {
    opensearch = {
      source  = "opensearch-project/opensearch"
      version = "~>2.3.1"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "~> 4.8.0"
    }
  }
  backend "s3" {}
}

provider "opensearch" {
  url      = var.opensearch_api
  insecure = true
  username = data.vault_kv_secret_v2.secrets["opensearch_cred"].data["username"]
  password = data.vault_kv_secret_v2.secrets["opensearch_cred"].data["password"]
  # username = tostring(ephemeral.vault_kvv2_secret.secrets["opensearch_cred"].data.username)
  # password = tostring(ephemeral.vault_kvv2_secret.secrets["opensearch_cred"].data.password)
}
