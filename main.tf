resource "azurerm_resource_group" "rg-aksdemo" {
  name     = var.resourcegroup
  location = "West Europe"
}

resource "azurerm_kubernetes_cluster" "aks-democluster" {
  name                = "aks-three-tier"
  location            = azurerm_resource_group.rg-aksdemo.location
  resource_group_name = azurerm_resource_group.rg-aksdemo.name
  dns_prefix          = "threetiercluster"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
  
  depends_on = [azurerm_resource_group.rg-aksdemo]

  tags = {
    Environment = "Development"
  }
}



