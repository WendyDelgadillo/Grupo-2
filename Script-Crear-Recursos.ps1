#Script para Creacion y Configuracion de Peering entre VNETs ubicadas en regiones distintas

#Declaracion de variables
$RESOURCE_GROUP_NAME = "PRACTICAS"
$LOCATION_1 = "eastus"
$LOCATION_2 = "westus"
$VNET1_NAME = "VNET1"
$SUBNET1_NAME = "SubNet1"
$VNET2_NAME = "VNET2"
$SUBNET2_NAME = "SubNet2"
$MAQUINA1 = "VM1"
$MAQUINA2 = "VM2"
$USER_NAME_1 = "justo"
$USER_NAME_2 = "kendall"


#Crear grupo de Recursos
az group create --name $RESOURCE_GROUP_NAME --location $LOCATION_1

#Verificamos la Creacion del grupo de Recursos
az group list

#Creamos la primer Vnet y SubNet en la region $LOCATION_1
az network vnet create --resource-group $RESOURCE_GROUP_NAME --name $VNET1_NAME --address-prefixes 10.1.0.0/16 --subnet-name $SUBNET1_NAME --subnet-prefixes 10.1.1.0/24 --location $LOCATION_1

#Creamos la segunda Vnet y subNet en la region $LOCATION_2/
az network vnet create --resource-group $RESOURCE_GROUP_NAME --name $VNET2_NAME --address-prefixes 10.2.0.0/16 --subnet-name $SUBNET2_NAME --subnet-prefixes 10.2.1.0/24 --location $LOCATION_2

#Verificar la creacion de las VNET en regiones diferentes
az vm list

#Creamos la primera maquina virtual, asociada a la $VNET1_NAME y con autenticacion de tipo SSH
az vm create --resource-group $RESOURCE_GROUP_NAME --name $MAQUINA1 --location $LOCATION_1 --vnet-name $VNET1_NAME --subnet $SUBNET1_NAME --image UbuntuLTS --size Standard_DS1_v2 --authentication-type ssh --generate-ssh-keys --admin-username $USER_NAME_1

#Creamos la segunda maquina virtual, asociada a la $VNET2_NAME y con autenticacion de tipo SSH
az vm create --resource-group $RESOURCE_GROUP_NAME --name $MAQUINA2 --location $LOCATION_2 --vnet-name $VNET2_NAME --subnet $SUBNET2_NAME --image UbuntuLTS --size Standard_DS1_v2 --authentication-type ssh --generate-ssh-keys --admin-username $USER_NAME_2

#Creamos el peering de la VNET 1 a la $VNET2_NAME
az network vnet peering create --name $VNET1_NAME-To-$VNET2_NAME --remote-vnet $VNET2_NAME --resource-group $RESOURCE_GROUP_NAME --vnet-name $VNET1_NAME --allow-vnet-access

#Creamos el peering de la $VNET2_NAME a la $VNET1_NAME
az network vnet peering create --name $VNET2_NAME-To-$VNET1_NAME --remote-vnet $VNET1_NAME --resource-group $RESOURCE_GROUP_NAME --vnet-name $VNET2_NAME --allow-vnet-access

#Verificamos la creacion y estado del Peering de la $VNET1_NAME a la $VNET2_NAME
az network vnet peering list --resource-group $RESOURCE_GROUP_NAME --vnet-name $VNET1_NAME --query "[].{Name:name, Resource:resourceGroup, PeeringState:peeringState, AllowVnetAccess:allowVirtualNetworkAccess}" --output table

#Verificamos la creacion y estado del peering de la $VNET2_NAME a la $VNET1_NAME
az network vnet peering list --resource-group $RESOURCE_GROUP_NAME --vnet-name $VNET2_NAME --query "[].{Name:name, Resource:resourceGroup, PeeringState:peeringState, AllowVnetAccess:allowVirtualNetworkAccess}" --output table

#Verificamos la ip publica de ambas VM
az vm list

#Comando para acceder a la $MAQUINA1 desde Powershell
#ssh $USER_NAME_1@40.88.121.251
#ping -c 4 10.2.1.4 <$MAQUINA1 a $MAQUINA2>

#Comando para acceder a la $MAQUINA2 desde Powershell
#ssh $USER_NAME_2@20.245.59.19
#ping -c 4 10.1.1.4 <$MAQUINA2 a $MAQUINA1>