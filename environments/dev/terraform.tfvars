rgs = {
  rg1 = {
    name       = "rg-pilu-dev-todoapp-01"
    location   = "centralindia"
    managed_by = "Terraform"
    tags = {
      env = "dev"
    }
  }
}

networks = {
  vnet1 = {
    name                = "vnet-pilu-dev-todoapp-01"
    location            = "centralindia"
    resource_group_name = "rg-pilu-dev-todoapp-01"
    address_space       = ["10.0.0.0/16"]
    tags = {
      environment = "dev"
    }
    subnets = [
      {
        name             = "frontend-subnet"
        address_prefixes = ["10.0.1.0/24"]
      },
      {
        name             = "backend-subnet"
        address_prefixes = ["10.0.2.0/24"]
      }
    ]
  }
}

public_ips = {
  app1 = {
    name                = "pip-pilu-dev-todoapp-01"
    resource_group_name = "rg-pilu-dev-todoapp-01"
    location            = "centralindia"
    allocation_method   = "Static"
    tags = {
      app = "frontend"
      env = "prod"
    }
  }
  app2 = {
    name                = "pip-pilu-dev-todoapp-02"
    resource_group_name = "rg-pilu-dev-todoapp-01"
    location            = "centralindia"
    allocation_method   = "Static"
    tags = {
      app = "frontend"
      env = "prod"
    }
  }
}


key_vaults = {
  kv1 = {
    kv_name  = "kvv1-pilu-dev-todoapp-01"
    location = "centralindia"
    rg_name  = "rg-pilu-dev-todoapp-01"
  }
}


vms = {
  vm1 = {
    nic_name    = "nic-frontend-vm-01"
    location    = "centralindia"
    rg_name     = "rg-pilu-dev-todoapp-01"
    vnet_name   = "vnet-pilu-dev-todoapp-01"
    subnet_name = "frontend-subnet"
    pip_name    = "pip-pilu-dev-todoapp-01"
    vm_name     = "frontend-vm"
    size        = "Standard_F2"
    kv_name     = "kvv1-pilu-dev-todoapp-01"
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }
  vm2 = {
    nic_name    = "nic-frontend-vm-02"
    location    = "centralindia"
    rg_name     = "rg-pilu-dev-todoapp-01"
    vnet_name   = "vnet-pilu-dev-todoapp-01"
    subnet_name = "backend-subnet"
    pip_name    = "pip-pilu-dev-todoapp-02"
    vm_name     = "backend-vm"
    size        = "Standard_F2"

    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }
}
