provider "vault"{
}


data "vault_kv_secret_v2" "db"{
  mount = "secret"
  name = "db-pass"
}