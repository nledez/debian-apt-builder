resource "openstack_compute_keypair_v2" "nlz-keypair" {
  name       = "nlz-keypair"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC8pzvPhEpfyYRC3OwIPD9MkDpWKI0dO/RaRB8qEiyNw2AdhxUkHbv70AgqQLCtpDS/y3XX1RDXSowQOW9CCw55PPfP2SBDGjBo0OkVDd1nIAqoBlrRpnyYZdWJhZVyuvTfGsv6BCbedRADMm4YOQDlKQsMh/BWnfh0JXrU2wVmnAImXMCSlV7fayJhzSka0dms7OmcQ2NCSj/HQFLeEIvDAxlpleCYihTp5E7AlCjlbo0QYkJrlX3P4AzMi9OZSjAWoOoib60P8gsyN/aoFiJGQXbGtlPqD9OsSkr/el+1bJZlBBBquRroWmEMROPZT6GcmCoFRKFdDi/oz8+dvNje4UwM2zpFxuZ08/XsNfEBPE1qm1AmQwKAAGsTVQvWwZI0lz9yvxe1b5sOCyAdtvWIN+2XrUJ1hyhhUDctM12cVMRj5vul3J8W/CbnHbhT+02VJ0EaSpqcnfJflp7NT4Z02mBwSl4vha7F2Y93sNE1/+2FpR0t4pdalqFcgJDj4KZngFFvcSD9w2UFyEAZEtZnA/7cYgbOcS8FNVAqKfWbYOBA9LXYhQA36upOQ4Wq9kEYwN1WBqJ5O3eACkrgQNHgVgaK6xoeK8yX+/OcmtuF83xAgyiaBleN5G4Jvj+kvubpKjcseEGQhufZ1csujysFFulE3R0FJuA8UKLxeKki7w== nico@jana"
}

resource "openstack_compute_instance_v2" "apt-builder" {
  name            = "apt-builder"
  image_name      = "Ubuntu 22.04 - UEFI"
  flavor_name     = "d2-4"
  key_pair        = resource.openstack_compute_keypair_v2.nlz-keypair.name
  security_groups = ["default"]

  network {
    name = "Ext-Net"
  }
}
