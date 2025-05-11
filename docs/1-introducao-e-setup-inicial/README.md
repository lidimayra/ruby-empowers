# Introdução e setup inicial

## Sobre o Ruby
Ruby é uma linguagem de programação dinâmica, orientada a objetos conhecida por sua sintaxe natural
que nos permite escrever código conciso e legível.

- Linguagem interpretada e de tipagem dinâmica
- Tudo é um objeto, incluindo números e tipos primitivos
- Foco em simplicidade e produtividade

## Sobre o Rails 
Ruby on Rails é um framework web de código aberto escrito em Ruby.
Esse framework segue dois princípios fundamentais:
- Convention over Configuration (CoC): Reduz decisões que desenvolvedores precisam tomar, estabelecendo 
convenções que funcionam bem na maioria dos casos.
- Don't Repeat Yourself (DRY): Incentiva a reutilização de código para evitar duplicações.

O Rails utiliza o padrão MVC (Model-View-Controller).

## Sobre o Docker
Docker é uma ferramenta que nos ajuda a fazer implantação de aplicações dentro de `containers`.
`Containers` são ambientes que contém tudo que uma aplicação precisa pra funcionar garantindo que 
funcione em qualquer computador.

### Dockerfile
Arquivo que contém instruções para construir a imagem docker. Define como a imagem será configurada, quais
arquivos estarão presentes e que comandos executarão durante a execução.

### Gems
Bibliotecas em ruby que fornecem recursos sem que você precise escrever todo o código do zero.
Essas bibliotecas são gerenciadas no Gemfile.

- Instalando uma gem
```
docker compose run web bundle add <nome_da_gem>
```

### Bundle
Gerencia as dependências do projeto. Garante que todas as gems serão instaladas corretamente. 

#### Principais Comandos:

`bundle install`

`bundle update`

`bundle update nome_da_gem`

`bundle exec rails server`

`bundle exec rails console`

### Generators
Ferramentas que automatizam geração de código no framework.

`rails generate controller Books index show new create edit`