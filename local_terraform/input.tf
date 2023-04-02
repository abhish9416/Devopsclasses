variable "file_name" {
  type    = list(string)
  default = ["text1.txt", "text2.txt", "text3.txt"]
}
variable "file_info" {
  type = map(object({
    name    = string
    content = string
  }))
  default = {
    "First" = {
      content = "First"
      name    = "text1.txt"
    },
    "second" = {
      content = "second"
      name    = "text2.txt"
    }
  }

}