
# Drupal 8

## Requisitos:

* Docker


## Instalação:
* Primeiramente se certifique de não ter nenhum processo executando na porta 80 ou 3306.

* Abra o terminal no diretório onde você clonou o projeto e rode os comando abaixo em sequência:

```sh
docker-compose build
docker-compose up -d
docker exec -it drupal_8_1 bash
``` 


* O último comando vai entrar no container. Deste modo basta executar os comandos abaixo dentro do container:

```sh
    cd /var/www/html
    drush dl drupal-8 --drupal-project-rename=public -y
    chown -R www-data:www-data public/sites/default
```

