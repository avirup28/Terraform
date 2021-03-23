resource "random_string" "randomkey" {
  length  = 6
  special = false
  upper = false
  number = false
}