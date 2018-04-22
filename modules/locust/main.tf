# -----------------------------------------------------------------------------
# Run locust in the distributed mode on remote servers.
# -----------------------------------------------------------------------------
# resource "null_resource" "stop_docker_containers" {
#   count = "${var.server_count}"
#   connection {
#     private_key = "${file("${var.private_ssh_key_path}")}"
#     host        = "${var.server_ips[count.index]}"
#     user        = "root"
#   }
#   provisioner "remote-exec" {
#     inline = [
#       "docker stop $(docker ps -a -q)",
#       "docker rm $(docker ps -a -q)",
#     ]
#   }
# }
# resource "null_resource" "start_traefik_proxy" {
#   connection {
#     private_key = "${file("${var.private_ssh_key_path}")}"
#     host        = "${var.server_ips[0]}"
#     user        = "root"
#   }
#   provisioner "remote-exec" {
#     inline = [
#       "docker run -d \
#        -p 80:80 \
#        -v /var/run/docker.sock:/var/run/docker.sock:ro \
#        traefik:1.4 --docker"
#     ]
#   }
# }
# resource "null_resource" "start_master_node" {
#   connection {
#     private_key = "${file("${var.private_ssh_key_path}")}"
#     host        = "${var.server_ips[0]}"
#     user        = "root"
#   }
#   provisioner "remote-exec" {
#     inline = [
#       "docker run -d \
#         -p 5557:5557 \
#         -p 5558:5558 \
#         -l traefik.backend=locust \
#         -l traefik.enable=true \
#         -l traefik.port=8089 \
#         -l traefik.frontend.rule="Host:${var.server_ips[0]}" \
#         -l traefik.frontend.auth.basic="profitbricks:$(openssl passwd -apr1 $var.proxy_password)" \
#         --env-file config/credentials \
#         --env-file $1 \
#         $IMAGE \
#         locust -f $2 --master --master-bind-port=5557"
#     ]
#   }
# }
# resource "null_resource" "stop_docker_containers" {
#   count = "${var.server_count}"
#   connection {
#     private_key = "${file("${var.private_ssh_key_path}")}"
#     host        = "${var.server_ips[count.index]}"
#     user        = "root"
#   }
#   provisioner "remote-exec" {
#     inline = [
#       "docker stop $(docker ps -a -q)",
#       "docker rm $(docker ps -a -q)",
#     ]
#   }
# }

