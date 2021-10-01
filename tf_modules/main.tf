module "slacko-app" {
  source      = "./modules/slacko-app"
  vpc_id      = "vpc-0aec82579257f768e"
  subnet_cidr = "10.0.102.0/24"
  app_name    = "rafaelsantos"
  app_tags = {
    Terraform   = "impacta"
    Environment = "rafael"

  }
}
output "slackip" {
  value = module.slacko-app.slacko-app
}
