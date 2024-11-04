resource "openstack_compute_keypair_v2" "ssh_public_key" {
  name       = "bob"
  public_key = var.ssh_public_key_default_user
}