locals {
  common_tags = var.tags
}



locals {
  common_tags = {
    env = var.env
    project = "robo shop"
    business_unit = "e-commerce"
    owner = "ecommerce-robot"

  }
}