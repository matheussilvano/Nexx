# Shell

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
for ec in 7205266 7619688 786169 6728028 6730213 10690928 6720999 6729464 6729810 738091 6729715 6729928 6730015 6730055 6729942 7923422 6730444 6721035 6729299 6722173 6973358 6721515 6727988 7356754 798946 6730304 6730243 6728404 6728060 10497115 6728231 6730821 6728519 6730912 10690928 6728138 10497130 620058 6729863 12379604 6730934 10497060 10497030 12379607 6729410 10497111 6728548 10032008 6729364 6729505 6790101 6722547 10497088 12942687 748258 6721725 6729518 6790107 8299395 6729397 620059 6730877 6728155 7180991 6721239 6730767 6729441 6721087 6729494 10497095 6721132 10497050 6730418 6727759 6729279 6730795 6730894 6721581 10497103 1120566 6728385 12379612 10690925 6729602 6722510 6721665 6721348 6727520 6729311 6730855 6728593 1107461 6729338 6721187 6727874 434942 6729244 6730858 10497108 10497123 6729687 6728302 6729905 6730109 6729761 6728350 6730740 6728316 6730802 10090691 6730826 10799268 600846 600845 612811 612812 8020574 593978 7412454 7412458 7412453 7412457 530281 611240 6730520 6729269 6727918 6727837 6729318 10497117 6730670 6728643 6729662 1107467 6727854 6727668 6722244 6731109 11938472 6728499 6721425 6729419 6728122 6721317 6722387 11938469 6729288 6727884 10690923 738091 6729733 6728430 6730606 6790110 10491995 6727717 10497046 1107467 6727529 6729449 6727813 6722479 6728002 6727514 13322272 6729329 6727627 6729581 13327677 6729376 6729633 6973339 6727794 6721390 6727641 10497106 6722637 6727589 6721284 10497076 6729257 6727690 6729351 6722597 6728192 6727581 11938472 6729479 1015699623 2808403393 2808405094 2808405086 2808405078 1017963450 2808405060 1032977822 2808405051  2808405043 2808405035 2808405027  2808405019 2808405000 2808404993 1074283349 2808403504 1000996473 1000996465 1000996457 1000996430 1000996414 1000329159 1000329167 1000742463 1000703832 1001552846 1003468818 1012570611 1004325603 1007005049 1038946600 1007619560 1027297061 1010812537 1012570620 1030799730 1026982020 1030193140 1038946112 1038946147 1038946449 1038994257 1038946155 1038946694 1038946210 1038946554 1038946236 1038946180 1038803761 1042736577 1040790582 1040926050 1040925690 1042349352 1043470600 1043470767 1043577677 1043990388 1036157919 1036162530 1042895721 1045672928 1080565776 1045938430 1048065496 1049632793 1049823866 1051184310 1053212850 1053212973 1061014093 1063958064 1064880654 1063318588 1029909072 1063319177 1029909641 1064322287 1064754810 1100254592 1099381808 1099374682 2808405949   2808405930 1112364754 2808403440 1112364746 1112364720 2808403431 1112364711 1112364703 1112364690 1112364681 2808405914 1095899560 2808403423 1112364649 1095900070 1095900339 1095900444 1095900770 1095901661 1095901742 1099298846 2808405906 1112364630 1112364622 1096037545 2808403415 1096037316 1096036980 1067104159 1067104140 2808405892 2808405884 2808405876 2808405841 2808405655  2808405515 2808405205 2808405191 2897655431 2808405183 2808405175 2808405167 2808405159 2808405140 2808405132 2808405124 1034490556 1100009857 1112364673 1112364665 1099614004 1017194405 2808403407 1017195274 1017195355 1017196289 1017196106 1017196238 1021748800 1023803426 1053378782 1053378812 1050013961 1053422390 2830819750 1099882289 2829887268 2896844559  1099882270 1099162006 1099882262 1099027931 1112415898 2777729446 2808405116  2808405108    1771884 2808403458 1019508539 1004175547 1000750210 1010797368 1000750229 1004175563 1005284056 1012320712 1019508474 1020830600 1020830651 1024573599 1024573688 1027063354 1031053678 1037726615 1041059504 1043074683 1051121563 1052074151 1052073929 1050497640 1055879347 1055710938 1055924458 1055924440 1058048535 1062193684 1069324474 2808405922 1042001704 2894154903  1072926102 2818170162 2808314994 2808314617 2808314226 2808314307 2808314340 2808315338 2808314196 2808314269 2808314323 2808314293 2808314331 2808314200 2808314820 2808314234 2808315036 2808314315 2808314285 2808315320 2808315311 2808314404 2808314250 2808314218 2808314277 2808314455 2808314242 2808314226 2808314250; do grep -q "$ec" * && echo -e "\033[0;32m$ec - Encontrado\033[0m" || echo -e "\033[0;31m$ec - Não encontrado\033[0m"; done
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

### Acessar mapa das operadoras Fiserv (sempre criar backup!!!)
```bash
cd ~/scripts/lpn/python_cartao/mapas/fiserv
```

### Saber os processos que rodam na cron

```bash
crontab | grep bankweb
```

### Visualizar o conteúdo do arquivo

```bash
`less [arquivo]`
```

### Logar com outro usuário

```bash
su - [usuario]
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
for cnpj in 91909881 91909385 91909625 91909364 91904540 91909675 91909705 91909487 91909683 91909368 91909741 91909337 91909907 91909754 91909828 91909633 91909917 91909853 91909734 91909724 91909330 91909322 91909361 91909902 91909839 91909893 91910871 91909474 91909373 91909870 91909581 91909473 91909820 91909594 91909412 91909481; do
    for i in ~/OPERADORAS.SEMRELACIONAMENTO/sent/*$cnpj*; do
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
