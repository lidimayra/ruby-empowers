# Ruby Empowers

Pré-requisito: Docker instalado

## Rodando a aplicação

```
# Constrói a imagem baseada no Dockerfile
docker compose build

# Configuração inicial do banco de dados, já alimentado com exemplos pré-definidos
docker compose run --rm web bin/rails db:setup

# Sobe o servidor
docker compose up
```

A aplicação agora pode ser acessada em http://localhost:3000

## Para rodar os testes
```
docker compose run web bin/rspec
```

1 - [Introdução e setup inicial](./docs/1-introducao-e-setup-inicial)

2 - [Fundamentos MVC e idealização do projeto](./docs/2-fundamentos-mvc)

3 - [Models](./docs/3-models)

4 - [Rotas e controllers](./docs/4-rotas-e-controllers)

5 - [Views](./docs/5-views)

6 - [Testes](./docs/6-testes)
