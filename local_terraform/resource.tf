resource "local_file" "soccer" {
  content  = each.value.content
  for_each = var.file_info
  filename = each.value.name
}