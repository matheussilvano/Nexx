#!/bin/bash

####################################################################
##                                                                ##
## MapaSodexo.sh                                                  ##
##                                                                ##
## Script para realizar alteração de ECs de forma semi automatica ##
## no mapa Sodexo                                                 ##
##                                                                ##
####################################################################

DataHoje=$(date +%d%m%Y)
BackupMapa="Mapa_Clientes_Sodexo_${DataHoje}_backup"
MapaSodexo=/home/skyline/scripts/sodexho/Mapa_Clientes_Sodexo

# Realiza a leitura do EC
read -p "Informe o EC (código de afiliado com 9 dígitos): " EcSodexo

# Procura o EC e informa a caixa postal (ID associado)
CaixaPostal=$(grep "^$EcSodexo" "$MapaSodexo" | awk '{print $2}')

read -p "A caixa postal cadastrada no mapa eh "$CaixaPostal", deseja realizar a troca? [S/N]: " ConfirmaTroca

if [[ "$ConfirmaTroca" =~ ^[Ss]$ ]]; then
    cp -pv "$MapaSodexo" /home/skyline/scripts/sodexho/$BackupMapa
    echo "Backup criado! -> $BackupMapa"
    read -p "Informe a nova caixa postal: " NovaCaixaPostal
    # Faz a substituição no arquivo original
    sed -i "s/^$EcSodexo .*/$EcSodexo $NovaCaixaPostal/" /home/skyline/scripts/sodexho/Mapa_Clientes_Sodexo
    echo "Caixa postal atualizada para $NovaCaixaPostal"
else
    echo "Nenhuma alteração foi feita."
fi
