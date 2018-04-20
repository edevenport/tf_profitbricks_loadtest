This Terraform module will create a single server within each availability zone in each ProfitBricks location.

Create a Terraform config file. For example, `main.tf`.

    module "loadtest" {
      source = "github.com/stackpointcloud/tf_profitbricks_loadtest"
    
      locations = [ "us/las", "us/ewr", "de/fra", "de/fkb" ]
      availability_zones = [ "ZONE_1", "ZONE_2" ]
      cores = 1
      ram = 1024
      disk_size = 5
      image_alias = "ubuntu:latest"
      private_ssh_key_path = "/path/to/.ssh/id_rsa"
      public_ssh_key_path = "/path/to/.ssh/id_rsa.pub"
      registry_host          = "hub.private.com"
      registry_host_username = "docker_username"
      registry_host_password = "docker_password"
    }

    output "server_ips" {
      value = "${module.loadtest.server_ips}"
    }

Initialize and run Terraform:

    terraform init
    terraform plan
    terraform apply

Docker:

    docker --tlsverify --tlscacert=ca.pem --tlscert=cert.pem --tlskey=key.pem -H=[IP_ADDRESS]:2376 info

Docker TLS authentication can also be set through environment variables.

    export DOCKER_CERT_PATH=$PWD
    export DOCKER_TLS=1
    export DOCKER_TLS_VERIFY=1

    docker -H=[IP_ADDRESS]:2376 info
