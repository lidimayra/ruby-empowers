# Introdução e setup inicial

## O que é docker?
Ferramente que nos ajuda a fazer implantação de aplicações dentro de `containers`.
`Containers` são ambientes que contém tudo que uma aplicação precisa pra funcionar garantindo que funcione em qualquer computador.

## Dockerfile
Arquivo que contém instruções para construir a imagem docker. Define como a imagem será configurada, quais arquivos estarão presentes e que comandos executarão durante a execução.

#TODO REMOVER ANTES DO TREINAMENTO: aqui é legal explicar cada linha do nosso dockerfile, mas não acho que vale colocar na doc, talvez num slide.


## Gems
Bibliotecas em ruby que fornecem recursos sem que você precise escrever todo o código do zero.
Essas bibliotecas são gerenciadas no Gemfile.

- Instalando uma gem manualmente:
```
docker compose run web bundle add <nome_da_gem>
```
- Inserir uma gem no gemfile.

## Bundle
Gerencia as dependências do projeto. Garante que todas as gems serão instaladas corretamente. 

### Principais Comandos:

`bundle install`

`bundle update`

`bundle update nome_da_gem`

`bundle exec rails server`

`bundle exec rails console`

## Generators:
Ferramentas que automatizam geração de código no framework.

`rails generate controller Books index show new create edit`


#### TODO remover depois de adicionar no slide:
Agora que a gente já explicou tudo pra elas sobre o setup inicial, acredito que é uma boa hora pra subir o servidor, ensinar a acessar no localhost e checar os logs como você pontuou.