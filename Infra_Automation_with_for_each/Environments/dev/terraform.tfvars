subscription_id = "e68115ea-4d91-49bd-814a-4725aba743a1"

rg_details = {
  rg1 = {
    rg_name    = "dev_rg1"
    rg_location = "east us"
  }
  rg2 = {
    rg_name    = "dev_rg2"
    rg_location = "east us"
  }
}


storage_account_details = {
    stg1 = {
      stg_name = "devstg1"
     rg_name    = "dev_rg1"
    rg_location = "east us"
  }
    stg2 = {
    stg_name = "devstg2"
    rg_name    = "dev_rg1"
    rg_location = "east us"
  }
}

nsg_details = {
  nsg1 = {
    nsg_name = "dev_nsg1"
    rg_name    = "dev_rg1"
    rg_location = "east us"
  }
}

vnet_details = {
  vnet1 = {
    vnet_name = "dev_vnet"
    rg_name    = "dev_rg1"
    rg_location = "east us"
  }
}

subnet_details = {
  subnet1 = {
    subnet_name = "dev_subnet"
    rg_name    = "dev_rg1"
    rg_location = "east us"
    nsg_name = "dev_nsg1"
  }
}

pip_details = {
  pip1 = {
    pip_name = "dev_pip"
    rg_name    = "dev_rg1"
    rg_location = "east us"
    allocation_method = "Static"
  }
}

vm_details = {
  vm1 = {
     nic_name = "dev_nic"
     vm_name = "dev_vm"
     rg_name    = "dev_rg1"
     rg_location = "east us"
     size = "Standard_DS1_v2"
     subnet_data_name = "subnet_id"
     vnet_name = "dev_vnet"
     private_ip_address_allocation = "Dynamic"
     pip_name = "nic-pip-01"
     kv_name = ""
     usernamesecretname = "usernamesecretname"
     usernamesecretpassword = "usernamesecretpassword"
    }
  }


kv_details = {
  kv1  = {
    kv_name = "devkv01"
    rg_name    = "dev_rg1"
    rg_location = "east us"
  }
}