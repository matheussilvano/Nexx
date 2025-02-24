# Shell

### JAR para liberar remessa (Log de Vendas)

- Abrir a console
```bash
cd "${SCRIPTS_DIR}/vizzoo_hubly/console/"
```
- Rodar o Jar
```bash
for i in ~/DEMO.SILVANO/mailbox/* ; do "${JAVA6_HOME}/bin/java" -jar nexxcard-console.jar Processo -p ProcessImportaArquivo -i $i -cnpj '16577631000299' -c 'nexxcard-config.properties' -verbose ; done
```
- OBS: Só funciona com Log de Vendas gerado no padrão da Nexxera, não para converter.

### Mover arquivos pra sent na chamada manager
```bash
/home/skyline/scripts/generico/Generico_Move_Retornos.sh &F BIQCARD.RETORNOS sent
```

### Ver alterações/execuções de um Script
```
~/scripts/sup3n/BuscaNEW.sh.run walmart_captura_log_vendas_veloce.sh
```

### Ver histórico de alguém:
```bash
cat ~/.history/alexandre.andrade/.history_skyline\:alexandre.andrade
```

### Acessar grade de comunicação:
```bash
~/scripts/sup3n/Grade.sh.run CAIXA.POSTAL YYYYMMDD
```

### Mapas Fiserv **CONVERTER**:
```bash
~/scripts/python/generico/cartoes_sitef_logvendas/mapas
```

### Reprocessamento de arquivos Loreal
Antes de importar, deve verificar se os arquivos terminam com .LPN
- Copiar os arquivos para a DEMO:
```bash
cp -pv *br_Transaction_Reports* ~/DEMO.SILVANO/mailbox
```
- Renomear os arquivos:
```bash
for i in *br_Transaction_Reports* ; do mv -v $i $(basename $i | cut -f1 -d\$) ; done
```
- Abrir a pasta Vizzo_hubly:
```bash
~/scripts/vizzoo_hubly/console
```
- Rodar o for de importação:
```bash
for i in ~/DEMO.SILVANO/mailbox/*.LPN ; do "${JAVA6_HOME}/bin/java" -jar nexxcard-console.jar Processo -p ProcessImportaArquivo -i $i -cnpj 30278428000161 -c 'nexxcard-config.properties' -verbose ; done
```

### Localizar Ecs que chegaram
```bash
for ec in 20489315 19282451 34840770 20977077 23370513 21118663 25317776 09844341 11241748 11090022 23160640 27907600 20630557 37326023 29142989 18935184 37145630 09996095 09844414 10835520 09844317 09844309 94194386 84184329 93414102 90988787 86349031 95385789 85197165 93414447 86391798 20977131 86334000 86324489 93647298 93647549 93934459 93648022 46814817 95208542 82392510 95208518 17446597 81078005 95208534 94192464 95534717 82256942 86302892 5162787 82452008 82393001 94767173 82451770 85170879 14199521 12427446; do grep -q "$ec" * && echo -e "\033[0;32m$ec - Encontrado\033[0m" || echo -e "\033[0;31m$ec - Não encontrado\033[0m"; done
```


### Quebra lote EE:
```bash
for i in ~/DEMO.SILVANO/mailbox/EXT_341_99059_* ; do ${TRADUTOR_CMD} /home/skyline/scripts/tradutor/bc/nexgenerico/QuebraLote.bc $i $i.saida@@ ; done
```

### Traduz/Importa EE:
```bash
for i in ~/DEMO.SILVANO/mailbox/EXT_341_99059* ; do /home/skyline/scripts/bankweb/Importador_Extrato_Generico.sh.run $i ; done
```

### Traduzir Pix Sicredi:
```bash
cd /home/skyline/scripts/lpn/python_cartao/
```
```bash
$PYTHON3 /home/skyline/scripts/lpn/python_cartao/principal_lpn_cartao.py sicredi-pix-v1 ~/DEMO.SILVANO/mailbox/PIX_SICREDI_92091891000157_20241104_000000.RET ~/DEMO.SILVANO/mailbox/PIX_SICREDI_92091891000157_20241104_000000.RET.LPN
```

### Traduzir Log de Vendas Converter
```bash
cd ${SCRIPTS_DIR}/python/generico/cartoes_sitef_logvendas
```
```bash
for i in ~/DEMO.SILVANO/mailbox/log* ; do [ -f "$i" ] && python  ${SCRIPTS_DIR}/python/generico/cartoes_sitef_logvendas/principal_Generico_Sitef_LpnLogVendas.py "$i" "${i}.LPN"; done
```

### Compactar/Descompactar arquivos

COMPACTAR: 
```bash
zip [nome_do_arquivo.zip]
```
DESCOMPACTAR (ZIP): 
```bash
unzip [nome_do_arquivo.zip]
```
DESCOMPACTAR (GZ): `[nome_do_arquivo.gz]`

### Acessar mapa das operadoras Fiserv **NOVO** (sempre criar backup!!!)
```bash
cd ~/scripts/lpn/python_cartao/mapas/fiserv
```

### Verificar processos em execução
```bash
ps -aux | grep nexxcard
```
<br>
Saída:

```bash
skyline  18946  0.2  0.0  66712  2036 ?        S    07:39   0:00 /bin/bash nome_do_processo
```

O segundo número (18946 nesse caso), é o PID, para matar um processo:
```bash
kill PID
```

### Grep com dois parâmetros
X ou Y:
```bash
cat arquivo | grep -E "palavra1|palavra2"
```
X e Y:
```bash
cat *Bancaria.csv | grep 03100513000758| grep Sodexo
```

### Quebrar Log de Vendas por operadora:
```bash
cd /home/skyline/scripts/nexxcard/console/python/
```

```bash
python filtrarTransacaoPorOperadora.py <cod_operadora> <arquivo>
```

### Saber os processos que rodam na cron

```bash
crontab | grep -i bankweb
```

### Alterar informação no Header do arquivo (Sempre deve ter a mesma quantidade de caracteres)
```bash
for i in 05_* ; do sed -i '1s/CIELO/CIELA/' $i ; done
```

### Extrair Pontos de venda dos arquivos traduzidos (LPN)
```bash
for i in ~/implantacao/DEMO.SILVANO/mailbox/BAHAMAS/TRADUZIDOS/* ; do /home/skyline/scripts/thyagos/extrair_pv_arquivo_lpn.sh.run $i ; done
```

### Visualizar o conteúdo do arquivo

```bash
`less [arquivo]`
```

### Logar com outro usuário

```bash
su - [usuario]
```
### Acessar uma "Sreen"
```bash
sudo su - skyline          ***
screen                     ***
Cannot open your terminal '/dev/pts/0' - please check. ***Tentei acessar mas não tem permissão, aparece a mensagem e a porta
exit                       *** Encerro a sessão do skyline
chmod 1777 /dev/pts/0      *** Consedo a permissão do meu usuário para a porta da mensagem
sudo su - skyline          *** Logo novamente no skyline
screen                     *** Para acessar agora com a permissão
ctr+a+d                    *** Para sair do screen
screen -r                  *** Para voltar para screen
```

### Mover ou renomear arquivo

RENOMEAR: `mv -v [arquivo] [novo_nome_do_arquivo]`
MOVER: `mv -v [arquivo] [destino]`


### Alterar permissões de pastas e arquivos:

```bash
chmod 777 [arquivo] ou [pasta]
```
Obs.: 4 = Leitura, 2 = Escrita, 1 = Execução.
A primeira casa é referente as permissões do usuário dono do arquivo, a segunda casa é referente as permissões do grupo de usuários e a terceira casa é referente as permissões dos outros usuários.

### Pesquisa em todas as caixas postais:
```bash
find ~/OPERADORAS.SEMRELACIONAMENTO/sent ~/.QUARENTENA/mailbox ~/CIELO.SEMPV/sent ~/ALELO.SEMPV/sent ~/POLICARD.SEMRELACIONAMENTO ~/TICKET.SEMRELACIONAMENTO -type f -name '*MMBCOMER*' -exec ls -ltr {} \;
```

### Liberação de arquivos em massa:
```bash
for cnpj in 91909881 91909385 91909625 91909364 91904540 91909675 91909705 91909487 91909683 91909368 91909741 91909337 91909907 91909754 91909828 91909633 91909917 91909853 91909734 91909724 91909330 91909322 91909361 91909902 91909839 91909893 91910871 91909474 91909373 91909870 91909581 91909473 91909820 91909594 91909412 91909481 92147063 92149038 92168360 92168359 92168774 92168832 92168826 92169104 92169043 92169092 92169059 92169100 92169082 92168809; do
    for i in ~/OPERADORAS.SEMRELACIONAMETNO/sent/*$cnpj*; do
        mv -v $i /var/spool/nexxera/skyline/recebe/ident/$(basename $i | cut -f1 -d\$);
       sleep 1;
    done;
done;
```

### Procura CNPJ em arquivo:
- Layout SE
```bash
sed -n 's/.*CV0\([0-9]\{14\}\).*/\1/p' ~/.QUARENTENA/mailbox/*biq_0006031* | uniq
```

- Layout Safrapay
```bash
sed -n 's/.*RO0\([0-9]\{14\}\).*/\1/p' ~/.QUARENTENA/mailbox/*EMPGRAN1* | uniq
```

### Copiar retornos de outra caixa postal (manager):
```bash
/home/skyline/scripts/generico/multiScripts.sh generico/Generico_Copia_Retornos.sh,&F,BRASILOR.LUXOTTICA
```

### Editar Mapa Sodexo:
```bash
cd ~/scripts/sodexho/
```
```bash
cp -pv Mapa_Clientes_Sodexo Mapa_Clientes_Sodexo_18042024_matheus_silvano (inserir data do dia)
```
```bash
vi Mapa_Clientes_Sodexo
```

### Caminho para o mapa Bellocard (criar backup antes de editar):
```bash
~/scripts/bellocard/cartoes/mapas
```

### Liberar arquivos de remessa (TEF):
#### Tirar "sujeira" se cair em quarentena:
```bash
for i in *relvenda*; do mv -v $i $(basename $i | cut -f '1' -d '$'); done
```
#### Libera os Arquivos:
```bash
for i in ~/DEMO.SILVANO/mailbox/*; do /home/skyline/scripts/inte_rvs/Judge /home/skyline/scripts/inte_rvs/judge.cfg INTERSOLID.LEMON $i; sleep 2; done
```

### Extrair datas de arquivo LPN:
```bash
for arquivo in ~/.QUARENTENA/mailbox/*BRASILCARD_CARREFOUR* ; do echo "Processando arquivo: $arquivo"; grep '^1' "$arquivo" | grep -oE '[0-3][0-9][0-1][0-9]2024'; done
```

## Shell Script
- É uma sequência lógica de comandos e instruções no Shell
- Além dos comandos, são utilizadas: Variáveis, instruções lógicas e condicionais
### Função 
- Automatizar e agilizar atividades
- Podem ser agendados na cron
- Cria ferramentas para auxiliar no serviço
- Aumento na produtividade
### O Shell
- É a interface entre o usuário e o sistema Linux
- É um interpretador de instruções
- Hardware > Kernel > Shell > Usuário
### Tipos de Shell
1. Bourne Shell (sh): Shell original e padrão do Unix
2. Bourne-Again Shell (bash): Shell padrão no Linux com melhorias
3. Korn Shell (ksh): Também é uma melhoria do bourne shell
4. C Shell (csh): Traz para o shell recursos na linguagem C <br>
OBS: echo $0 mostra o shell utilizado

### Comandos mais utilizados

  COMANDO CD
    ```bash
    `cd [nome-do-diretório]`
    . -> Diretório atual
    .. ou - -> Diretório anterior
     ~ ou -- -> Diretório home do usuário
     / -> Diretório Raiz
    ```

  COMANDO LS
    ```bash
    `ls -[opcoes] [argumento]`
    -l  detalhado
    -t  ordem cronológica (caso não utilize, fica em ordem alfabética)
    -r  ordem inversa
    -a  lista todos os arquivos (inclusive ocultos)
    ```

  COMANDO PS
  ```bash
   `ps axu`
    - Mostra todos os processos realizados
  ```

  COMANDO TOUCH
  ```bash
   `touch [nome_do_arquivo]`
    - Cria um arquivo zerado (sem conteúdo)
    - Se for utilizado em um arquivo já existente, altera-se apenas o horário de modificação
  ```

  COMANDO HELP
  ```bash
  `[comando] --help`
    - Informa tudo que pode ser utilizado em um comando
  ```

  COMANDO ECHO
  ```bash
   `echo [argumento]`
    - Mostra o argumento desejado na saída
    -n não quebra a linha
    -e reconhce comandos utilizando \
  ```

  COMANDO MKDIR
  ```bash
   `mkdir -[opcao] [nome_do_diretorio]`
    - Cria um diretório
    -p Cria toda a árvore do diretório (ex: mkdir -p diretorio1/diretorio2)
  ```

  COMANDO RM
  ```bash
   `rm -[opcao] [nome_do_arquivo]`
    - Remove por padrão apenas arquivos
    -r Remove diretórios (para diretórios vazios, pode-se usar rmdir)
    -f Não exibe mensagem de erro
    -v Mostra os arquivos apagados
   ```

  COMANDO SLEEP
  ```bash
   `sleep [n]`
    - Conta um tempo n em segundos para a próxima execução
  ```

  COMANDO CAT
  ```bash
   `cat [arquivo]`
    - Imprime o conteúdo do arquivo
    -b enumera as linhas com conteúdo
    -n enumera todas as linhas
    -A demonstra os caracteres especiais(tabulações)
  ```

  COMANDO TAC
  ```bash
   `tac [arquivo]`
    - Possui a mesma função do CAT, porém lê os arquivos debaixo para cima
  ```

  COMANDO TAIL
  ```bash
   `tail -n[n] [arquivo]`
    - Mostra as últimas [n] linhas do arquivo
  ```

  COMANDO HEAD
  ```bash
   `head -n[n] [arquivo]`
    - Mostra as [n] primeiras linhas do arquivo
    - o -n pode ser trocado por -c para mostrar os primeiros [n] caracteres
  ```

  COMANDO WC
  ```bash
   `wc -[opcao] [arquivo]`
    - Mostra a quantidade da informação desejada
    -l linhas
    -w palavras
    -m caracteres
    -c bytes (normalmente é o mesmo número de caracteres)
  ```

  COMANDO SORT
  ```bash
   `sort [arquivo]`
    - Ordena um arquivo em ordem alfabética/numérica
    - sort -r ordena inversamente
    - sort -k[n] utiliza [n] como o índice de ordenação (Ex: Em uma lista com nomes e sobrenomes sort -k2 ordenaria pelos sobrenomes)
    - -t"[delimitador]" informa qual o delimitador dos campos
    - -g é utilizado para ordenar números
  ```

  COMANDO UNIQ
  ```bash
   `uniq [arquivo]`
    - Retira informações repetidas que estiverem ordenadas
    - Pode ser misturado com o sort para um melhor funcionamento (sort [arquivo] |uniq
    - -u exclui tudo o que estiver repetido
    - -d mostra apenas o que foi repetido
    - -c mostra quantas vezes a informação foi repetida
  ```

  COMANDO TR
  ```bash
   `cat [arquivo] |tr [caractere1] [caractere2]`
    - Troca todos os caracteres 1 por caracteres 2
    - a-z A-Z troca tudo o que for minúsculo por maiúsculo
    - se não for utilizado nenhum caractere2, o caractere1 é deletado
  ```

  COMANDO CUT
  ```bash
    `cat [arquivo] | cut -[opcao][n]`
      - Corta itens desejados
      - -c corta caracteres
      - -f corta campos inteiros (palavras)
      - [n]- corta tudo que estiver após esse número
  ```

  COMANDO DIFF
  ```bash
   `diff [arquivo1] [arquivo2]`
    - Mostra a diferença entre dois arquivos
    - -w mostra apenas diferenças de conteúdo (sem contar espaços ou tabulações)
    - -r mostra a diferença entre diretórios
  ```

  COMANDO GREP
  ```bash
   `grep [conteudo] [arquivo]`
    - Busca um conteúdo dentro de um arquivo
    - Deve-se usar "" quando for uma string com mais de uma palavra
    - -i mostra tanto minúsculo quanto maiúsculo
    - -c conta quantas vezes localizou essa palavra dentro do arquivo
    - -v vai mostrar apenas o que não tiver a palavra desejada
    - -r procura dentro de diretórios
    - -l lista os arquivos que possuem o conteúdo, mas não mostra onde
    - -A[n] mostra n linhas após o conteúdo desejado
    - -B[n] mostra n linhas antes do conteúdo desejado
  ```

  COMANDO SED
  ```bash
   `sed '[linha1,[linha2] [opcao]' [arquivo]`
    - Deleta/altera linhas (Ex: sed '1,3 d' arquivo.txt -> deleta da linha 1 à 3 do arquivo.)
    - d é usado para deletar
    - s é usado para substituir
    - /conteúdo para procurar por conteúdo específico
  ```

  COMANDO MORE
  ```bash
   `more [arquivo]`
    - Mostra o conteúdo do arquivo de forma mais dinâmica
  ```

  COMANDO LESS
  ```bash
   `less [arquivo]`
    - Funciona como o more, porém com mais opções
    - /conteudo para pesquisar (n para a próxima ocorrência)
  ```

  COMANDO FIND
  ```bash
   `find /[diretorio] [conteudo]`
    - Procura um conteúdo dentro do arquivo
    - -name Procura pelo nome do arquivo dentro do diretório
  ```

#### Comandos sequenciais

 PIPE (|)
 ```bash
   `[comando1] |[comando2]`
    - Usa a saída do primeiro comando como entrada para o segundo
    - Ex: tail -n5 [arquivo] |wc -w (contará o número de caracteres das 5 últimas linhas do arquivo)
 ```

  PONTO E VÍRGULA (;)
  ```bash
   `[comando1] ; [comando2]`
    - Executa dois comandos sequencialmente (um após o outro)
    - É diferente do "|" pois os comandos serão executados separadamente
  ```

  &&
  ```bash
   `[comando1] && [comando2]`
    - Tem a mesma função do ";", porém só executará o segundo comando se o primeiro funcionar
  ```

  DUPLO PIPE (||)
  ```bash
   `[comando1] || [comando2]`
    - Só executará o segundo comando se houver algum erro com o primeiro
  ```

  PARENTESES ()
  ```bash
   `(comando)`
    - Abre uma espécie de "sub-shell"
    - Ex: ( cd .. ; ls -l ) -> dará um ls dentro do diretório anterior sem sair do atual
  ```

## Redirecionamento ##
  - Todo script em Shell possui uma entrada e duas saídas (saída padrão e saída de erro)
  - Entrada = `STDIN`
  - Saída padrão = `STDOUT`
  - Saída de erro = `STDERR`
  - Normalmente ambas as saídas são apresentadas na tela, porém podem ser redirecionadas
  - \> Cria um novo arquivo com a saída desejada (caso já haja algo no arquivo, tudo será excluído)
  - \>\> Tem a mesma função do >, porém caso já haja conteúdo no arquivo, será incluído embaixo
  - Para redirecionar uma mensagem de erro, usa-se 2> ou 2>>
  - Ex: `ls -l arquivo.txt > log.out 2> log-erro.out` (caso dê certo irá para log.out, caso haja erro, irá para log-erro.out)
  - `2>&1` redireciona o erro para a mesma pasta da saída comum
  - `/dev/null` é o "buraco negro" das saídas, pode ser usado para ocultar mensagens de erro
  - `tr` mostra o que foi realizado na entrada

## Variáveis ##
  - Podem ser achadas no comando env (ou set, que também reconhece as variáveis não exportadas)
  - É um nome que armaneza um valor
  - $ é utilizado para "chamar" uma variável
  - Variáveis devem começar com letras (normalmente maiúsculas) ou "_"
  - Para declarar uma variável basta fazer: VARIAVEL1=Valor
  - Para criar uma variável com espaços/tabulações, deve ser protegida com ""
  - Quando uma variável é declarada, ela não é gravada. Caso o shell seja fechado, a variável será excluída
  - export é usado para que os processos filhos do processo incial também reconheçam a variável
  - a variável pode ser dada por um comando, utilizado crases HORA=`date +%H`, ou também pode ser utilizado por meio da junção de $ e parênteses MINUTO=$(date +%M)

## Uso das aspas ##
  - São usadas principalmente para proteger caracteres especiais
  - "" -> protege todos os caracteres com excessão de: $ ` /
  - '' -> protege TODOS os caracteres

## O VI ##
 `vi [arquivo]`
  - Entra por padrão no modo de navegação
  - digitando i, entra no modo de inserção (s volta)
  - : entra em modo de comando
  - :1 vai para a primeira linha do arquivo
  - :$ vai para a última linha do arquivo
  - :[n] vai para a linha n
  - :![comando] faz um comando no bash e volta para o VI
  - / busca pelo item desejado (n para o próximo)
  - d[n]d recorta o número n de linhas após a que o cursor estiver
  - p cola 
  - y[n]y copia o número n de linhas após a que o cursor estiver
  - https://www.smashingmagazine.com/2010/05/vi-editor-linux-terminal-cheat-sheet-pdf/
  - :w salva
  - :wq ou :x salva e sai do arquivo
  - :q! sai do arquivo sem salvar

## File Globbing ##
  - Utilização de caracteres especiais para realizar ações desejadas
  - * Seleciona tudo o que estiver antes ou depois do que for desejado (ex: ls aula*)
  - [] Busca somente os caracteres desejados, contando apenas um caractere por vez, (ex: ls aula[123])
  - {} Busca somente as palavras desejadas (ex: ls {AULA,aula,Aula}1)
  - ? Considera o número de ? como caracteres qualquer (ex: ls aula1? -> considera da aula 10 à 19)
  
## REGEX (Expressões regulares) ##
  - Utilização de caracteres especiais para criação de um padrão de texto
  - egrep: é um grep que aceita mais expressões regulares
  - [] Busca caracteres desejados (ex: egrep "[Ll]inux" arquivo.txt)
  - ^ motra o conteúdo apenas se for o primeiro da linha (ex: egrep "^linux" arquivo.txt)
  - $ mostra apenas o conteúdo que estiver no final da linha (ex: egrep "linux$" arquivo.txt)
  - * o caractere anterior pode ou não aparecer (ex: egrep "b[a-i]g*" arquivo.txt também buscaria ba)
  - + Mostra apenas quando o caractere anterior pode aparecer uma ou mais vezes
  - ? O caractere anterior pode aparecer uma ou nenhuma vez
  - . Faz a função do ? no File Globbing
  - .* procura qualquer informação entre duas palavras

## Criação de um script ##
  - para a criação de um arquivo usa-se vi
  - a extensão utilizada por padrão é .sh
  - é ideal manter um padrão de letras maiúsculas, minúsculas e underlines
  - a primeira linha do script é a indicação de qual interpretador será utilizado (#!/bin/bash)
  - $PATH -> São os diretórios padrões, onde não precisam de caminho (~/) para serem executados
  - Para adicionar um diretório no PATH, usa-se PATH="$PATH:/home/diretório" (apenas no shell local)
  - Para ver tudo o que estiver no PATH, usa-se echo $PATH
  - Para adicionar definitivamente um diretório no PATH, usa-se vi ~/.profile e adiciona-se o que for desejado.
  - Comentários: Existe um padrão de comentário a ser feito (Começando sempre com #)
    - 1. Cabeçalho: Mostra a função do Script, quem criou, quando foi criado e alterações:
```bash
#############################################
#
# NomeDoScript.sh - Script para fazer tal coisa
#
# Autor: Matheus Silvano (email@dominio.com)
# Data Criação: 30/02/2024
#
# Descrição: Faz não sei o que, com o objetivo de não sei o que lá
#
# Exemplo de uso: ./NomeDoScript.sh
#
# Alterações
#    Dia X - Inclusão do não sei o que
#    Dia Y - Correção do bug tal
#
#######################################################
```

- 2. Antes ou depois de cada função
```bash
# Função de leitura de data e hora
(código)

sort ../diretorio/arquivo # Caminho do arquivo para tal coisa
```

  - Váriáveis
    - São utilizadas para deixar o código mais legivel e para armazenar informações que possam ser alteradas futuramente
    - `DATAHORA=$(date +%H:%M)`
    - Usa-se o $ apenas para chamar a variável, não para declará-la

  ## Exit codes ##
- São os códigos de saída rodados ao final de um script, indo de 0 à 255
- 0 = sucesso
- Qualquer coisa diferente de 0 significa um erro
- echo $? retorna o código de saída do comando anterior
- Normalmente os erros são 1 ou 2
- man [comando] informa os exit codes de um comando e o que signficam
- o comando exit pode ser usado para sair de um script sem rodar o que estiver após ele 
- exit [n] -> para o processo e usa o número [n] como exit code

  ## Recebendo uma entrada do usuário ##
- Através do comando read:
- read NOME -> Criará uma variável NOME com o que o usuário inserir
- Caso as variáveis sejam inseridas juntas, separadas por espaços, a resposta será dividida da mesma forma. Ex: `read VAR1 VAR2 VAR3 -> entrada: Curso Shell Script -> $VAR1 = Curso, $VAR2 = Shell, $VAR3 = Script`
- Caso existam menos variáveis que palavras, a primeira váriavel irá capturar a primeira palavra e a segunda variável irá capturar o restante da frase
- Sempre pode ser usado read --help para descobrir todas as funcionalidades
- `-p` -> Informa algo para a entrada. Ex: read -p "Informe o CNPJ: " CNPJ
- `-s` -> Não aparece no prompt (ideal para senhas)

- Através de parâmetros:
- `$0` -> Armazena o nome do script
- `$#` -> Quantidade de parâmetros inseridos
- `$*` -> Todos os parâmetros inseridos
- `$1-9` -> Cada um dos parâmetros
- Exemplo de uso: `./scrit.sh teste` (executaria o script com o parâmetro teste)

- Instruções condicionais 
    
  ## If ##

```bash
if <comando-condicao>
then
    comando1
    comando2
fi
```

```bash
if <comando-condicao>
then
    comando1
else
    comando2
fi
```

```bash
if <comando-condicao>
then
    comando1
elif <comando-condicao>
then
    comando2
else
    comando3
fi
```

- No if do shell, não se usa uma condição, mas sim um comando
- pode-se usar o comando test para validar se uma expressão está correta (0=correta)
- Para testar valores numéricos, pode-se usar:
    -eq -> igual (equal)
    -ne -> diferente (not equal)
    -gt -> maior que (greater than)
    -ge -> maior ou igual (greater equal)
    -lt -> menor que (lower than)
    -le -> menor ou igual (lower equal)

- Para testar strings, pode-se usar:
    = -> uma string igual a outra
    != -> uma string diferente da outra
    -n -> string não nula
    -z -> string nula

- Para testar arquivos, pode-se usar:
    -f -> É um arquivo
    -d -> É um diretório
    -r -> Tem permissão de leitura
    -w -> Tem permissão de escrita
    -x -> Tem permissão de execussão
    -s -> Possui tamanho maior que 0

- Exemplos:
    test 50 -gt 100 -> retorno > 0 (falso)
    test -f /tmp/teste -> caso o arquivo exista retorno = 0 (verdadeiro)
    também pode ser usado: [50 -gt 100]
    ```bash
    if ["$VAR1" -gt 10]
    then
        echo sucesso
    fi
    ```
- após o if, pode-se usar um ! para afirmar negação
    ```bash  
    if [!"$VAR1" -gt 10] # se VAR1 não for igual a 10
    then
        echo sucesso
    fi
    ```

- Pode-se usar o -a (and) para validar mais de uma variável ao mesmo tempo
    ```bash
    if ["$VAR1" -gt 10 -a "$VAR1" -lt 20] 
    then
        echo sucesso
    fi
    ```

- Para validar uma variável ou outra, pode-se usar -o (or)
    ```bash
    if ["$VAR1" -gt 10 -o "$VAR1" -eq 5] 
    then
        echo sucesso
    fi
    ```

## Case ##
- É usado quando um valor possui vários padrões possíveis (com o objetivo de não fazer vários ifs)
```bash
case $valor in
    padrao1)
        comando
        ;;
    padrao2)
        ;;
    *)            # funciona como um else
        comando
        ;;
esac
```

- É muito utilizado para menus:
```bash
case $OPCAO_DO_USUARIO in
    1)
        echo "Incluir"
        ;;
    2)
        echo "Remover"
        ;;
    *)
        echo "Opção inválida"
        ;;
esac
```

- Instruções de loops
    - São utilizadas para executar uma série de comandos em ciclos
    - For, While e Until

  ## For ##

```bash
for variavel in valor1 valor2
do
    comando1
    comando2
done
```

```bash
for numero in 1 2 3 4 5
do
    echo "O número atual é $numero"
done
```

```bash
for arquivo in alunos*
do
    echo "$arquivo"
done
```

```bash
for sequencia in $(seq 5 10)
do
    echo "$sequencia"
done
```
```bash
for (( i=5 ; -<=20 ; i++ ))
do
    echo "$i"
done
```

 - IFS (Internal Field Separator)
    - set|grep IFS para visualizar
    - Por padrão o IFS é: espaço, tab ou quebra de linha
    - Para alterar o IFS:
        - Criar um backup: OLDIFS=$IFS
        - Alerar o IFS para o que desejar: IFS=seoarador_desejado

  ## While ##
- Executa um comando enquanto algo for verdadeiro
```bash     
while comando-condicao
do
    comando1
done
```

## Until ##
- Faz um comando até que algo seja verdadeiro (enquanto for falso)
```bash
until comando-condicao
do
    comando1
done
```

## Break ##
- Força a saída de um loop

## Continue ##
- Reinicia o loop, sem executar o que está abaixo

- Funcões
    - É um trecho de código que exerce uma rotina específica dentro do script
    - Evita a repetição excessiva em um código
    - Reduz o tamanho do script
    - Facilita a manutenção
```bash
function nome-funcao (){
    comando
}
```

para chamar a função: `nome-funcao`, ou atribuir a uma variável

- Criando logs

  ## Redirecionamento ##
    `./script.sh >> log.out 2>> log_erro.out ->` (não aparece saída na tela)
    - Para jogar a saída na tela, pode-se usar: ~/script.sh | tee -a log.out
    - Dentro de um script, pode-se criar a variável $LOG e direcionar informações como data diretamente para o log, facilitando a visualização.
    Por exemplo:
```bash
echo "$(date) - Iniciando o Script..." >> $LOG
...
echo "$(date) - Finalizando o Script..." >> $LOG
```

- Também dentro do script, para mover tudo para o log, pode-se usar:
    `exec 1>> $LOG`
    `exec 2>&1`

  ## Rsyslog ##
    `cd /etc/rsyslog.d/`
    `vi 50-default.conf`
    - Possui os logs padrões do ambiente

- Enviar e-mails
    - comando: mail
    - sudo apt-get install bsd-mailx
      `mail -s "Assunto" email@dominio.com < arquivo_com_conteudo.txt`
    - Também pode-se direcionar após um comando
        echo "texto" | mail -s "assunto" email@dominio.com

- Debug

  ## Erros de sitaxe ##
    - Após tentar executar o comando, normalmente o erro já é mostrado
      `bash -n script.sh` -> testa, mostra os erros, mas não executa o script

  ## Erros de lógica ##
    - É interessante usar echos durante o script para ver aonde o código está travando
    `bash -x` -> adiciona um sinal de + em todos os comandos executados
    `bash -v` -> mostra os comandos executados por blocos, com seus resultados
    Pode ser usado `bash -xv`, que soma os dois
