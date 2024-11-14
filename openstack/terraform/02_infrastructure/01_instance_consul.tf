module "consul" {
  source                         = "../modules/instance"
  instance_count                 = 3
  instance_name                  = "consul"
  instance_key_pair              = "bob"
  instance_security_groups       = ["consul", "ssh-internal", "default"]
  instance_network_internal      = var.network_internal_dev
  public_floating_ip             = false
  instance_ssh_key               = var.ssh_public_key_default_user
  instance_network_external_name = var.network_external_name
  instance_network_external_id   = var.network_external_id
  instance_volumes_count = 1
  metadatas = {
    environment = "dev"
    app = "consul"
  }

}
