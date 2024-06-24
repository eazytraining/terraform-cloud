

# Créez un fichier main.tf avec la ressource Azure
resource "azurerm_resource_group" "example" {
  name     = "my-eazytraining-rg"
  location = "West Europe"
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
