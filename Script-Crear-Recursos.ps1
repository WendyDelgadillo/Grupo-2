#Script para Creacion y Configuracion de Peering entre VNETs ubicadas en regiones distintas

#Crear grupo de Recursos
az group create --name PRACTICAS --location eastus

#Verificamos la Creacion del grupo de Recursos
az group list

#Creamos la primer Vnet y SubNet en la region EastUs
az network vnet create --resource-group PRACTICAS --name VNET1 --address-prefixes 10.1.0.0/16 --subnet-name SubNet1 --subnet-prefixes 10.1.1.0/24 --location eastus

#Creamos la segunda Vnet y subNet en la region Westus
az network vnet create --resource-group PRACTICAS --name VNET2 --address-prefixes 10.2.0.0/16 --subnet-name SubNet2 --subnet-prefixes 10.2.1.0/24 --location westus

#Verificar la creacion de las VNET en regiones diferentes
az vm list

#Creamos la primera maquina virtual, asociada a la VNET1 y con autenticacion de tipo SSH
az vm create --resource-group PRACTICAS --name VM1 --location eastus --vnet-name VNET1 --subnet SubNet1 --image UbuntuLTS --size Standard_DS1_v2 --authentication-type ssh --generate-ssh-keys --admin-username justo

#Creamos la segunda maquina virtual, asociada a la VNET2 y con autenticacion de tipo SSH
az vm create --resource-group PRACTICAS --name VM2 --location westus --vnet-name VNET2 --subnet SubNet2 --image UbuntuLTS --size Standard_DS1_v2 --authentication-type ssh --generate-ssh-keys --admin-username kendall

#Creamos el peering de la VNET 1 a la VNET2
az network vnet peering create --name VNET1-To-VNET2 --remote-vnet VNET2 --resource-group PRACTICAS --vnet-name VNET1 --allow-vnet-access

#Creamos el peering de la VNET2 a la VNET1
az network vnet peering create --name VNET2-To-VNET1 --remote-vnet VNET1 --resource-group PRACTICAS --vnet-name VNET2 --allow-vnet-access

#Verificamos la creacion y estado del Peering de la VNET1 a la VNET2
az network vnet peering list --resource-group PRACTICAS --vnet-name VNET1 --query "[].{Name:name, Resource:resourceGroup, PeeringState:peeringState, AllowVnetAccess:allowVirtualNetworkAccess}" --output table

#Verificamos la creacion y estado del peering de la VNET2 a la VNET1
az network vnet peering list --resource-group PRACTICAS --vnet-name VNET2 --query "[].{Name:name, Resource:resourceGroup, PeeringState:peeringState, AllowVnetAccess:allowVirtualNetworkAccess}" --output table

#Verificamos la ip publica de ambas VM
az vm list

#Comando para acceder a la VM1 desde Powershell
#ssh justo@40.88.121.251
#ping -c 4 10.2.1.4 <VM1 a VM2>

#Comando para acceder a la VM2 desde Powershell
#ssh kendall@20.245.59.19
#ping -c 4 10.1.1.4 <VM2 a VM1>