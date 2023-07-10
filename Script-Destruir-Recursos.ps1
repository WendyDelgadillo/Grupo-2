#Script para la detencion y Eliminacion de los recursos

#Comando para eliminar el Peering de VNET1 a VNET2
az network vnet peering delete --resource-group PRACTICAS --name VNET1-to-VNET2 --vnet-name VNET1

#Comando para eliminar el Peering de VNET2 A VNET1
az network vnet peering delete --resource-group PRACTICAS --name VNET2-to-VNET1 --vnet-name VNET2

#Detener la maquina Virtual 1
az vm stop --resource-group PRACTICAS --name VM1

#Detener la maquina Virtual 2
az vm stop --resource-group PRACTICAS --name VM2

#Eliminar la Maquina Virtual 1
az vm delete --resource-group PRACTICAS --name VM1

#Eliminar la Maquina Virtual 2
az vm delete --resource-group PRACTICAS --name VM2

#Eliminar grupo de recursos
az group delete --name PRACTICAS

#Verificar la eliminacion del grupo de recursos
az group list