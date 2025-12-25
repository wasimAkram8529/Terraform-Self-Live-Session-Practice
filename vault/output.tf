output "database_password"{
  value = data.vault_kv_secret_v2.db.data["<Your Password key>"]
  sensitive = true
}