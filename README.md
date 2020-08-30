# Flafka (Apache Flume + Apache Kafka)

Repositório criado com o objetivo de facilitar o uso local do flume + kafka para testes e desenvolvimento.

Pré requisitos:
  - Docker
  - Docker Compose
  - Make
  - Credenciais da API do Twitter

### Build das imagens

O download dos arquivos necessário e o build das images estão configurados no Makefile, sendo necessário apenas executar o comando abaixo no diretório raaiz do repositório:

```sh
$ make install
```
O build das imagens depende do download de arquivos do Flume e do Kafka, alem de ser necessário compilar alguns arquivos do Kafka, então esse procedimento levará um tempo.

### Iniciando o ambiente

Primeiramente crie um arquivo chamado credentials.env. Este arquivo irá disponibilizar suas credenciais de uso da API do twitter para o Flume. O conteúdo do arquivo deve sequir o formato abaixo:

ACCESS_TOKEN=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
ACCESS_TOKEN_SECRET=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
CONSUMER_KEY=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
CONSUMER_SECRET=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

Depois de criar o arquivo credentials.env execute o script start.sh passando como argumento o nome do arquivo que o flume usará para iniciar o agente. Estes arquivos estão na pasta conf/flume/config_files. Neste exemplo irei utilizar o arquivo spool-to-kafka.properties
```sh
$ sh ./scripts/start.sh spool-to-kafka.properties
```