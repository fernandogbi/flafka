# Flafka (Apache Flume + Apache Kafka)

Repositório criado com o objetivo de facilitar o uso local do flume + kafka para testes e desenvolvimento.

Pré requisitos:
  - Docker
  - Docker Compose
  - Make
  - Credenciais da API do Twitter (Opcional, caso queria executar o exemplo 2)

### Build das imagens

O build das images está configurado no Makefile, sendo necessário apenas executar o comando abaixo no diretório raiz do repositório para que ele baixe os arquivos do Flume e do Kafka e inicie o build das imagens Docker:

```sh
$ make install
```
O build das imagens depende do download de arquivos do Flume e do Kafka, alem de ser necessário compilar alguns arquivos do Kafka, então esse procedimento levará um tempo.

### Iniciando o ambiente

O ambiente foi pré configurado com dois exemplos práticos, e com alguns scripts para facilitar o uso. Abaixo estão descritos o passo a passo para cada exemplo:

#### Exemplo 1 (Spool to Kafka)

Para iniciar o ambiente execute o comando abaixo na raiz do repositório:
```sh
$ sh ./scripts/start.sh spool-to-kafka.properties
```
O arquivo start.sh recebe como parãmetro o nome do arquivo de configuração que o Flume deve utilizar. Neste caso o arquivo utilizado será o spool-to-kafka.properties. Este arquivo está na pasta conf/flume/config_files.

Com essa configuração o Flume irá ler o conteúdo de texto dos arquivos colocados na pasta conf/flume/spool_to_kafka e publicar o conteúdo no tópico spool_to_kafka do Kafka. Quando o flume realizar a leitura e o envio do conteúdo, o arquivo será renomeado com um ".COMPLETED".

Agora que o ambientes está sendo executado, execute o comando abaixo para visualizar as entradas no tópico spool_to_kafka:
```sh
$ sh scripts/topics-consumer.sh spool_to_kafka
```
Seu terminal irá consumir todas as mensagens que o Flume irá enviar com o conteúdo dos arquivos de texto na pasta conf/flume/spool_to_kafka. Você pode criar um arquivo de texto próprio e salva-lo no diretório, mas para facilitar o teste do ambiente exitem 4 arquivos de texto na pasta documents. Voce pode copiar um desses arquivos para a pasta do Flume.

Assim que o arquivo for copiado para a pasta você conseguirá ver a saída do tópico no terminal, e também verá que o arquivo foi renomeado com o ".COMPLETED".

#### Exemplo 2 (Twitter to Kafka)

Neste exemplo o Flume irá coletar tweets e realizar o envio ao tópico twitter_to_kafka. Neste exemplo é necessário que você tenha preenchido o arquivo credentials.env com as informações referentes as suas credenciais da API do Twitter.

Com as credencias devidamente configuradas no arquivo credentials.env, execute o seguinte comando:
```sh
$ sh sh scripts/start.sh twitter-to-kafka.properties
```
Use o mesmo script do exemplo anterior para consumir os tweets que o Flume enviará ao tópico do Kafka, apenas altere o nome do tópico que será consumido, como no exemplo abaixo:
```sh
$ sh scripts/topics-consumer.sh twitter_to_kafka
```
Com a execução do comand acima deverá aparecer no terminal vários tweets coletados em streamming pelo Flume e enviados para o Kafka.

Ao finalizar os testes você pode excluir todo o ambiente com o comando abaixo:
```sh
$ sh scripts/destroy.sh
```
