#!/bin/bash#!/bin/bash
# Autor: Rodrigo Costabrava
# Site: www.optimizedata.info
# Facebook Profile: https://www.facebook.com/rodrigo.juan.129
# Facebook FanPage: https://www.facebook.com/OptimizeData-773886072942405/?modal=admin_todo_tour
# YouTube: https://www.youtube.com/channel/UCBvI72XalAfzkQSSSh-D51g
# Data de criação: 30/01/2019
# Data de atualização: 30/01/2019
# Versão: 0.01
# Testado e homologado para a versão do Ubuntu Server 18.04.x LTS x64
# Kernel >= 4.15.x
#
# Vídeo de instalação do GNU/Linux Ubuntu Server 18.04.x LTS: https://www.youtube.com/watch?v=zDdCrqNhIXI
#
# Vídeo de instalação do LAMP Server no Ubuntu Server 18.04.x LTS: https://www.youtube.com/watch?v=6EFUu-I3u4s
#
# Vídeo de instalação do Wordpress no LAMP do Ubuntu Server 18.04.x LTS: https://www.youtube.com/watch?v=Fs2B7kLdlm4
#
# Webmin é um programa de gerenciamento de servidor, que roda em plataformas Unix/Linux. Com ele você pode usar também o 
# Usermin e o Virtualmin. O Webmin funciona como um centralizador de configurações do sistema, monitoração dos serviços e de
# servidores, fornecendo uma interface amigável, e que quando configurado com um servidor web, pode ser acessado de qualquer
# local, através de um navegador: https:\\(ip do servidor):(porta de utilização). Exemplo: https:\\172.16.1.20:10000
#
# Variável da Data Inicial para calcular o tempo de execução do script (VARIÁVEL MELHORADA)
# opção do comando date: +%T (Time)
HORAINICIAL=`date +%T`
#
# Variáveis para validar o ambiente, verificando se o usuário e "root", versão do ubuntu e kernel
# opções do comando id: -u (user), opções do comando: lsb_release: -r (release), -s (short), 
# opções do comando uname: -r (kernel release), opções do comando cut: -d (delimiter), -f (fields)
# opção do caracter: | (piper) Conecta a saída padrão com a entrada padrão de outro comando
# opção do shell script: acento crase ` ` = Executa comandos numa subshell, retornando o resultado
# opção do shell script: aspas simples ' ' = Protege uma string completamente (nenhum caractere é especial)
# opção do shell script: aspas duplas " " = Protege uma string, mas reconhece $, \ e ` como especiais
USUARIO=`id -u`
UBUNTU=`lsb_release -rs`
KERNEL=`uname -r | cut -d'.' -f1,2`
#
# Variável do caminho do Log dos Script utilizado nesse curso
VARLOGPATH="/var/log/"
#
# Variável para criação do arquivo de Log dos Script
# $0 (variável de ambiente do nome do comando)
# opção do caracter: | (piper) Conecta a saída padrão com a entrada padrão de outro comando
# opção do shell script: acento crase ` ` = Executa comandos numa subshell, retornando o resultado
# opção do shell script: aspas simples ' ' = Protege uma string completamente (nenhum caractere é especial)
# opções do comando cut: -d (delimiter), -f (fields)
LOGSCRIPT=`echo $0 | cut -d'/' -f2`
#
# Variável do caminho para armazenar os Log's de instalação
LOG=$VARLOGPATH/$LOGSCRIPT
#
# Variável do download do Webmin - (Link de download atualizado em: 20/01/2019)
WEBMIN="https://prdownloads.sourceforge.net/webadmin/webmin_1.900_all.deb"
#
# Verificando se o usuário e Root, Distribuição e >=18.04 e o Kernel >=4.15 <IF MELHORADO)
# [ ] = teste de expressão, && = operador lógico AND, == comparação de string, exit 1 = A maioria dos erros comuns na execução
clear
if [ "$USUARIO" == "0" ] && [ "$UBUNTU" == "18.04" ] && [ "$KERNEL" == "4.15" ]
	then
		echo -e "O usuário e Root, continuando com o script..."
		echo -e "Distribuição e >=18.04.x, continuando com o script..."
		echo -e "Kernel e >= 4.15, continuando com o script..."
		sleep 5
	else
		echo -e "Usuário não e Root ($USUARIO) ou Distribuição não e >=18.04.x ($UBUNTU) ou Kernel não e >=4.15 ($KERNEL)"
		echo -e "Caso você não tenha executado o script com o comando: sudo -i"
		echo -e "Execute novamente o script para verificar o ambiente."
		exit 1
fi
#
# Script de instalação do Webmin no GNU/Linux Ubuntu Server 18.04.x
# opção do comando echo: -e (enable interpretation of backslash escapes), \n (new line)
# opção do comando hostname: -I (all IP address)
# opção do comando date: + (format), %d (day), %m (month), %Y (year 1970), %H (hour 24), %M (minute 60)
echo -e "Início do script $0 em: `date +%d/%m/%Y-"("%H:%M")"`\n" &>> $LOG
clear
#
echo -e "Instalação do Webmin no GNU/Linux Ubuntu Server 18.04.x\n"
echo -e "Após a instalação do Webmin acessar a URL: https://`hostname -I`:10000/\n"
echo -e "Aguarde, esse processo demora um pouco dependendo do seu Link de Internet..."
sleep 5
echo
#
echo -e "Adicionando o Repositório Universal do Apt, aguarde..."
	# opção do comando: &>> (redirecionar a entrada padrão)
	add-apt-repository universe &>> $LOG
echo -e "Repositório adicionado com sucesso!!!, continuando com o script..."
sleep 5
echo
#
echo -e "Atualizando as listas do Apt, aguarde..."
	# opção do comando: &>> (redirecionar a entrada padrão)
	apt update &>> $LOG
echo -e "Listas atualizadas com sucesso!!!, continuando com o script..."
sleep 5
echo
#
echo -e "Atualizando o sistema, aguarde..."
	# opção do comando: &>> (redirecionar a entrada padrão)
	# opção do comando apt: -y (yes)
	apt -y upgrade &>> $LOG
echo -e "Sistema atualizado com sucesso!!!, continuando com o script..."
sleep 5
echo
#
echo -e "Removendo software desnecessários, aguarde..."
	# opção do comando: &>> (redirecionar a entrada padrão)
	# opção do comando apt: -y (yes)
	apt -y autoremove &>> $LOG
echo -e "Software removidos com sucesso!!!, continuando com o script..."
sleep 5
echo
#
echo -e "Instalando o Webmin, aguarde..."
echo
#
echo -e "Instalando as dependências do Webmin, aguarde..."
	# opção do comando: &>> (redirecionar a entrada padrão)
	# opção do comando apt: -y (yes)
	apt -y install perl libnet-ssleay-perl openssl libauthen-pam-perl libpam-runtime libio-pty-perl apt-show-versions python &>> $LOG
echo -e "Instalação das dependências feita com sucesso!!!, continuando com o script..."
sleep 5
echo
#
echo -e "Fazendo o download do Webmin, aguarde..."
	# opção do comando: &>> (redirecionar a entrada padrão)
	wget $WEBMIN &>> $LOG
echo -e "Download do Webmin feito com sucesso!!!, continuando com o script..."
sleep 5
echo
#				 
echo -e "Instalando o Webmin, aguarde..."
	# opção do comando: &>> (redirecionar a entrada padrão)
	# opção do comando dpkg: -i (install)
	WEBMINVERSION=`echo webmin*`
	dpkg -i $WEBMINVERSION &>> $LOG
echo -e "Instalação do Webmin feita com sucesso!!!, continuando com o script..."
sleep 5
echo
#
echo -e "Verificando a porta de conexão do Webmin, aguarde..."
	# opção do comando netstat: -a (all), -n (numeric)
	netstat -an | grep 10000
echo -e "Porta de conexão verificada com sucesso!!!, continuando com o script..."
sleep 5
echo
#
echo -e "Instalação do Webmin feito com Sucesso!!!"
	# script para calcular o tempo gasto (SCRIPT MELHORADO, CORRIGIDO FALHA DE HORA:MINUTO:SEGUNDOS)
	# opção do comando date: +%T (Time)
	HORAFINAL=`date +%T`
	# opção do comando date: -u (utc), -d (date), +%s (second since 1970)
	HORAINICIAL01=$(date -u -d "$HORAINICIAL" +"%s")
	HORAFINAL01=$(date -u -d "$HORAFINAL" +"%s")
	# opção do comando date: -u (utc), -d (date), 0 (string command), sec (force second), +%H (hour), %M (minute), %S (second), 
	TEMPO=`date -u -d "0 $HORAFINAL01 sec - $HORAINICIAL01 sec" +"%H:%M:%S"`
	# $0 (variável de ambiente do nome do comando)
	echo -e "Tempo gasto para execução do script $0: $TEMPO"
echo -e "Pressione <Enter> para concluir o processo."
# opção do comando date: + (format), %d (day), %m (month), %Y (year 1970), %H (hour 24), %M (minute 60)
echo -e "Fim do script $0 em: `date +%d/%m/%Y-"("%H:%M")"`\n" &>> $LOG
read
exit 1
