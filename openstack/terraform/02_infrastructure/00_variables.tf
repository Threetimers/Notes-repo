variable "network_external_id" {
  type    = string
  default = "0f9c3806-bd21-490f-918d-4a6d1c648489"
}

variable "network_external_name" {
  type    = string
  default = "ext-floating1"
}

variable "network_internal_dev" {
  type    = string
  default = "internal_dev"
}

variable "network_subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "ssh_public_key_default_user" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCrElTM3PeNc2R4muimskfdkX6unj9jbEkFTimjNDuysgbzozSaXIW7ZMl/8LQm6Wsf/imI99wbC78g7LwYxn7XOU/0i3T4TxOKyi+p0MBearwQ7dXtXH82Cg4z6dVrp3bZ2A32TclVhHcle36XzUfa7gsfku+Uus9jYwt5rYwTaREGnYhmKWipCEWbNK5wG6OxDjpPCCB8iv1ewnADGXqzyUeF3z/eg2PLIIDlHv5x/A0dU8A5tAVjsW6czN4BWROgo2S57cCMXkoqcvn17p49lij9kzTFeLbw5+7ak5nHHzc9fOAHmCjrZuMnnJuR5UZgx6XyVVdROkID8OZ3j5cpDWSlX3igRiFE7i1Ndk7nfBoq/hGDZyx4GBNQuTyUtaKLBqgdHarMk6SRJWUHJlvD64dAWK3nK6seUCni+iIh14wI/2wR8IbA29EdMMhtiI1mJlM7te+h4pKHcwyK5Y38CwCTCt/Mgruc2p1sPxyu909lymgDh3wRQXirlg24gGY7G+hHONhO8OFpensRwosWx+NDOQlvUIPS1pL8VralBEUBcRh3JQ6kzr/neMcy8x75nTM7cGOULgHZY3tbs9Cb7H1qI2280wns3Mtud0mkulv5BGdV8Ap9mLon/W4KmBnmrCwU+UJaElJjN+D3HZN3vC9frMujqmxaszkZ6uu3Pw== xavik"
}

variable "instance_image_id" {
  type    = string
  default = "cdf81c97-4873-473b-b0a3-f407ce837255"
}

variable "instance_flavor_name" {
  type    = string
  default = "a1-ram2-disk20-perf1"
}

variable "instance_security_groups" {
  type    = list(any)
  default = ["default"]
}

variable "metadatas" {
  type = map(string)
  default = {
    "environment" = "dev"
  }
}


