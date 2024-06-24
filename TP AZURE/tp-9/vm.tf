
terraform {
  backend "azurerm" {
    resource_group_name  = "my-eazytraining-rg"
    storage_account_name = "terraformbackend<votre prénom>"
    container_name       = "tfstate"
    key                  = "path/to/my/key/terraform.tfstate"
  }
}

# Ressources Azure
resource "azurerm_resource_group" "example" {
  name     = "my-eazytraining-rg"
  location = "West Europe"
}

resource "azurerm_storage_account" "terraform_backend" {
  name                     = "terraformbackend<votre prénom>"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name   = azurerm_storage_account.terraform_backend.name
  container_access_type = "private"
}


resource "azurerm_virtual_network" "example" {
  name                = "my-eazytraining-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_subnet" "example" {
  name                 = "my-eazytraining-subnet"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_security_group" "example" {
  name                = "my-eazytraining-nsg"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  dynamic "security_rule" {
    for_each = var.security_rules
    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.source_port_range
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = security_rule.value.source_address_prefix
      destination_address_prefix = security_rule.value.destination_address_prefix
    }
  }

  tags = {
    environment = lookup(var.environment_tags, "staging")
  }
}

resource "azurerm_network_interface" "example" {
  name                = "my-eazytraining-nic"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "my-eazytraining-nic-ip"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "example" {
  name                = "my-eazytraining-vm"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  size                = "Standard_B1s" # Vous pouvez utiliser la variable instance_types ici
  admin_username      = "azureuser"
  admin_password      = "Password1234!"

  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]

 source_image_reference {
    publisher = data.azurerm_platform_image.eazytraining-image.publisher
    offer     = data.azurerm_platform_image.eazytraining-image.offer
    sku       = data.azurerm_platform_image.eazytraining-image.sku
    version   = data.azurerm_platform_image.eazytraining-image.version
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  tags = {
    environment = lookup(var.environment_tags, "staging")
  }
}
