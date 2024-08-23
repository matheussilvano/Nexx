# Instalação do Skyline

## Conceitos básicos

O Skyline dispõe de uma estrutura de diretórios onde são colocados os arquivos recebidos, os arquivos a serem enviados e os já enviados. A estrutura de diretórios segue o padrão abaixo, porém, essa estrutura pode ser alterada por meio do arquivo wtcm.ini.

- Inbox: pasta onde são salvos os arquivos recebidos pelo Skyline;
- Outbox: pasta onde devem ser colocados os arquivos que serão enviados pelo Skyline;
- Sentbox: pasta para onde são movidos os arquivos já enviados, é tratada como pasta de backup de arquivos já transmitidos pelo Skyline.

### Arquivos

- Skyline.exe: É o executável do Skyline client.
- Wtcm.ini: arquivo de configuração do Skyline Cliente. É neste arquivo que se configura o meio de conexão, servidor e porta de comunicação, identificação da caixa postal do cliente, nome da caixa postal destinatária, script de conexão, entre outros.
- Session.log: Arquivo de log da versão Skyline Cliente.

## Criando a Caixa Postal

No Commander, acesse a aba “Usuários” e crie as caixas postais no padrão:

- DOMINIO.CLIENTE
- DOMINIO.BANCOS

Na caixa CLIENTE, habilite o usuário para comunicação e insira a senha no padrão “dominio19”.

Na caixa BANCOS, adicione os parâmetros abaixo:

Script (aba Processamento):

`/home/skyline/scripts/juizdredd/JuizDredd.sh "&F"`

Regra de renomeamento:

```
*.*.*.*.*|*.*.*.*.*.!!!!!
*.*.*.*|*.*.*.*.!!!!!
*.*.*|*.*.*.!!!!!
*.*|*.*.!!!!!
*|*.!!!!!
```

Ao entrar em contato com o cliente, certifique-se de que ele já possui o documento de conectividade em mãos. (https://form.jotformz.com/71282872722661)

Também confirme com o cliente se ele efetuou a liberação da porta 7700 para o DNS edi2.skyline.com.br. Essa liberação é indispensável para que o Skyline se comunique com o servidor da Nexxera.

## Skyline Windows

Acesse o diretório Dominator da pasta do Skyline Windows e execute o aplicativo. O Dominator é responsável por fixar o domínio da caixa postal no executável do Skyline. Selecione o executável do Skyline, que estará no diretório anterior, e insira o domínio. Depois clique em “Dominate”.

![image](https://github.com/user-attachments/assets/e9dc3983-d2c1-4e35-af0a-8232d3a31330)

Agora que o executável possui o domínio da caixa postal, edite o parâmetro username do WTCM e insira o CLIENTE. Assim, a caixa postal DOMINIO.CLIENTE completa está configurada. O DOMINIO fica no executável e o CLIENTE no WTCM.

Por fim, configure no WTCM os diretórios de remessa, retorno e backup informados no formulário. O diretório de remessa corresponde ao parâmetro outbox, o de retorno ao parâmetro inbox e o backup ao parâmetro sentbox.

No WTCM modelo você também encontrará três pastas de saída que apontam para as caixas postais PAGELET, COBELET e TEF. Elas apontam, respectivamente, aos portais de Pagamento, Cobrança e Nexxcard e são responsáveis por importar as remessas nas aplicações. Mesmo que o cliente não utilize esses portais no primeiro momento, mantenha os parâmetros para que tudo já esteja configurado caso o cliente opte por utilizar.

### Instalação

crie uma pasta zipada contendo os itens abaixo:

- Skyline dominado
- WTCM
- Manual do Skyline
- Manual de segurança do Skyline

Faça o upload deste zip na própria caixa postal do Skyline Web.

Oriente o cliente a acessar o Skyline Web e baixar o zip. Depois, solicite que o mova para o diretório do Skyline informado no documento de conectividade e descompacte os arquivos.

O cliente deve agora executar o Skyline para realizarmos um teste de execução. Neste momento, informe a senha e acompanhe a grade de comunicação da empresa no Commander.

Fluxo correto:
![image](https://github.com/user-attachments/assets/fbcf15e3-b60c-4306-aaed-992559b258f6)

### Automação

O Skyline Windows é automatizado por meio do Agendador de Tarefas do Windows

Pesquise por “Agendador de Tarefas” (ou “Task Scheduler”, se o Windows estiver em inglês) no menu iniciar e abra o aplicativo

Na barra de ferramentas, acesse o menu Ação > Criar Tarefa Básica

Defina o nome da tarefa como “Skyline Automatizado” e clique em avançar

Defina o disparador da tarefa como “ao fazer logon”

Defina a ação a ser executada como “iniciar um programa”

Insira o caminho completo do executável do Skyline e adicione o parâmetro `/SE=senhadoskyline` logo abaixo, onde senhadoskyline é a senha que você configurou para a caixa postal

Na tela final, selecione “Abrir a caixa Propriedades…” e clique em Concluir

Na aba “Geral” da tela de propriedades que irá abrir, marque as opções abaixo:

![image](https://github.com/user-attachments/assets/df08b27a-edfe-4bb5-b787-4f2b5ee11401)

Na aba “Disparadores”, clique em “Editar” e altere os itens abaixo:

![image](https://github.com/user-attachments/assets/bddec394-6333-458d-9848-7fa2a3d9181c)

Clique em ok e salve a tarefa. Confirme na lista de tarefas ativas se ela está salva.

Por fim, altere o WTCM do cliente e inclua o parâmetro invisible=TRUE. Isso fará com que as execuções automáticas não apareçam ao usuário.

![image](https://github.com/user-attachments/assets/e7ad27c7-348c-4bff-a911-de1019b5e355)
























