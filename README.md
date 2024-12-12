# Instalação do DBT Core

____

## Passo-a-passo para configuração do ambiente para o **DBT**.

Primeiro passo para configurar o dbt é instalar o python versão >= 3.7

Voce pode obter a versão mais atual do python [aqui](https://www.python.org/downloads/)

Agora crie uma pasta para o seu projeto e depois vamos criar o ambiente virtual de instalação:

``` shell
.venv\Scripts\activate
```

Agora vamos acessar o ambiente virtual:

``` shell
.venv\Scripts\activate
```
Ao ativar o ambiente virtual, podemos visualizar quais as bibliotecas estão instaladas usando:


``` shell
pip freeze
```

Agora vamos instalar o necessário para que o dbt funcione:


``` shell
pip install dbt-core
```

``` shell
pip install dbt-postgres
```

Agora que instalamos o dbt, podemos ver o que está instalado no ambiente virtual, após a instalação:

``` shell
pip freeze
```

Com o dbt instalado, execute:

``` shell
dbt --version
```
> Só pra ter certeza de que a instalação deu certo.

## Configuração do datasource 

Instale o postgres em seu pc, utilizando este [link](https://www.postgresql.org/download/)

Com o postgres instalado, abra o psql e acesse as credenciais que foram confiradas na instalação.
> OBS.: Usuário e senha padrões do postgres são: 
>-  User: postgres
>- Password: postgres

Segue abaixo as fontes de dados.

Pegue [aqui](./sources/) os arquivos para criação do ambiente da fonte de dados. Execute na seguinte sequencia:
1. [tb_cliente.csv](./sources/tb_cliente.csv)
2. [tb_produto.csv](./sources/tb_produto.csv)
3. [tb_vendas.csv](./sources/tb_vendas.csv)
4. [tb_vendedor.csv](./sources/tb_vendedor.csv)

## Configuração do **dbt** para conectar em um banco de dados local (postgres)

Vamos iniciar o projeto dbt:

``` shell
dbt init nome_seu_projeto
```
Vá até a pasta do projeto:

``` shell
cd nome_seu_projeto
``` 
Para validar se está tudo funcionando:
``` shell
dbt debug
``` 

Configure os dados para conexão. Esta configuração irá gerar o arquivo `profiles.yml`

Se vc usa windows, vá até o executar e escreva os dados abaixo e de um `Enter`:

``` shell
%userprofile%\.dbt\
```
Isso abrirá a pasta onde o arquivo profiles foi criado. Configure o arquivo de acordo com os seus dados de conexão.

Após a configuração a pasta do projeto dbt já foi gerada e podemos começar a partir daqui.

