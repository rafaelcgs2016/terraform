module "jenkinsapp" {
  # module source
  source = "./modules/jenkins-app"


  vpc_id = "vpc-0aec82579257f768e"


  subnet_cidr = "10.0.102.0/24"

  app_name = "jenkins"

  app_tags = {
    env      = "prod"
    project  = "slack"
    customer = "cliente1"
  }

  # App Instance type
  app_instance = "t2.medium"

}

resource "null_resource" "getJenkinsPwd" {
  triggers = {
    instance = module.jenkinsapp.jenkins-app
  }
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("${path.module}/modules/jenkins-app/files/slacko")
    host        = module.jenkinsapp.jenkins-app
  }
  provisioner "remote-exec" {
    inline = [
      "sleep 300",
      "sudo cat /var/lib/jenkins/secrets/initialAdminPassword",
    ]
  }
}

output "jenkins-ip" {
  value = module.jenkinsapp.jenkins-app
}
