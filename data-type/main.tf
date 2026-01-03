// List Data Type
# variable "my-list" {
#   type = list(string)
#   default = ["alice", "bob", 123, true]
# }

# output "my-list-output" {
#   value = var.my-list
# }

# output "my-list-output-for-index" {
#   value = var.my-list[3]
# }

// Set Data Type
# variable "my-set" {
#   type = set(string)
#   default = ["bob", "Alice", 123, true]
# }

# output "my-set-output" {
#   value = var.my-set
# }

// Map Data Type
variable "my-map" {
  type = map(number)
  default = {a = 20, b = 23}
}

output "my-map-output" {
  value = var.my-map
}