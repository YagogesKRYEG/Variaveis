#!/bin/bash
#criação das variaveis locais
USUARIO="root"
TESTE01=$(test A == A ; echo $?)
TESTE02=$(test -f /etc/passwd ; echo $?)
USUARIOS=$(who  | awk '{print $1}')

#utilizando o comando echo para imprimir na tela os valores das variaveis locais 
#e variaveis especias do shell 
echo "impressão na tela......................: ola,mundo!!!"
echo "Nome do Usuario........................: $USUARIO"
echo "Nome do arquivo shell..................: $0"
echo "quantidade de parametros...............: $#"
echo "todos os parâmetros....................: $*"
echo "parametro 01...........................: $1"
echo "paramêtro 02...........................: $2"
echo "status do comando anterior.............: $?"
echo "PID do processo........................: $$"
echo "Comando: test A == B...................: $TESTE01"
echo "comando: test -f /etc/passwd...........: $TESTE02"
echo "Usuarios logados.......................: $USUARIOS"

#utiliznado o comando if para fazer os teste logicos e
#validar o ambiente
if [ $USUARIO == root ];
then	
	echo "teste de usuario:..................: Usuario é root"
else
	echo "teste de usuario:..................: Usuario não é root"
fi

#Utilizando o comando if encadeado para aumentar a qunatidade dos 
#testes logicos
if [ $TESTE01 -eq 0 ];
then
	echo "Resultado do camando test é........: VERDADEIRO"
elif [ $TESTE01 -eq 1 ];
then
	echo "Resultado do camando test é........: FALSO"
fi

#utilizando o comando case para fazer os teste logicos 
#é validar o ambiente
case $TESTE01 in
 	0) echo "Resultado do comando case é........: 0 - Verdadeiro";;
 	1) echo "Resultado do comando case é........: 1 - falso";;
 	*) echo "Resultado do comando case é........: NÃO INDETIFICADO"
 esac
 
 #utilizando o comando read para receber os
 #valores e fazer o teste logico com case
 read -p "Digite as letras: A,B ou C............:" LETRAS;
 case $LETRAS in
 	A|a) echo "A Letra digita foi...............:$LETRAS";;
	B|b) echo "A Letra digita foi...............:$LETRAS";;
	C|c) echo "A Letra digita foi...............:$LETRAS";;
	*) echo "letra digitada errada..............:$LETRAS"
esac

#utilizando o laço de loop for para verificar os numeros digitados 
#junto com o comando read
read -p "uma sequencia de números...............:" NUMEROS;
for VALORES in $NUMEROS;
do
	echo "Números passados para o loop..........: $VALORES"
done

#Utilizando o laço de loop for para gerar uma tabuada junto com o 
#comando read 
read -p "Digite um numero da tabuada............:" NUMERO;
for TABUADA in $(seq 0 10);
do
	echo "$NUMERO X $TABUADA...........: $(($TABUADA * $NUMERO))"
done

#utilizando o laço de loop while para alcançar os valores
#desejados com o comando read
read -p "Digite um numero de inicio.............:" INICIO;
read -p "Digite um numero de FIM................:" FIM;
while [ $INICIO -le $FIM ];
do
	echo "Valor de sequencia numerica...........:$INICIO"
	let INICIO=INICIO+1
done