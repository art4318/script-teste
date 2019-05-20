#!/bin/bash

echo Atualizando repositórios..
if ! apt-get update
then
    echo "Não foi possível atualizar os repositórios. Verifique seu arquivo /etc/apt/sources.list"
    exit 1
fi
echo "Atualização feita com sucesso"

echo "Atualizando pacotes já instalados"
if ! apt-get dist-upgrade -y
then
    echo "Não foi possível atualizar pacotes."
    exit 1
fi
echo "Atualização de pacotes feita com sucesso"

# note que $1 aqui será substituído pelo Bash pelo primeiro argumento passado em linha de comando
echo "Instalação NTP..."
if ! apt-get install -y ntp
then
    echo "Não foi possível instalar o pacote NTP"
    exit 1
fi
echo "Instalação finalizada"

echo ""; echo ""

echo "Instalação FTPD..."
if ! apt-get install -y ftpd
then
    echo "Não foi possível instalar o pacote FTPD"
    exit 1
fi
echo "Instalação finalizada"

echo ""; echo ""

echo "Instalação SSH..."
if ! apt-get install -y openssh-server
then
    echo "Não foi possível instalar o pacote SSH"
    exit 1
fi
echo "Instalação finalizada"
