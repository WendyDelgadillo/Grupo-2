#Script para la detencion y Eliminacion de los recursos

#Declaracion de variables
$RESOURCE_GROUP_NAME = "PRACTICAS"
$MAQUINA1 = "VM1"
$MAQUINA2 = "VM2"


#Comando para eliminar el Peering de VNET1 a VNET2
az network vnet peering delete --resource-group $RESOURCE_GROUP_NAME --name VNET1-To-VNET2 --vnet-name VNET1

#Comando para eliminar el Peering de VNET2 A VNET1
az network vnet peering delete --resource-group $RESOURCE_GROUP_NAME --name VNET2-To-VNET1 --vnet-name VNET2

#Detener la maquina Virtual 1
az vm stop --resource-group $RESOURCE_GROUP_NAME --name $MAQUINA1

#Detener la maquina Virtual 2
az vm stop --resource-group $RESOURCE_GROUP_NAME --name $MAQUINA2

#Eliminar la Maquina Virtual 1
az vm delete --resource-group $RESOURCE_GROUP_NAME --name $MAQUINA1

#Eliminar la Maquina Virtual 2
az vm delete --resource-group $RESOURCE_GROUP_NAME --name $MAQUINA2

#Eliminar grupo de recursos
az group delete --name $RESOURCE_GROUP_NAME

#Verificar la eliminacion del grupo de recursos
az group list