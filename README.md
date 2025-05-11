# Ruby Empowers

Esse repositório contém conteúdos e atividades práticas aplicadas durante o treinamento Ruby Empowers. 

## Rodando a aplicação
Pré-requisito: Docker instalado

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

4 - [Introdução ao TDD](./docs/4-introducao-ao-tdd)

5 - [Rotas e controllers](./docs/5-rotas-e-controllers)

6 - [Views](./docs/6-views)
