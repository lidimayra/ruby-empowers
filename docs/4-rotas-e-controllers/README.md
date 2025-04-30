# Rotas e controllers

## Resourceful routing

Ao desenvolver uma aplicação seguindo os padrões REST, existem 7 actions comuns que precisamos ter
sempre em mente: _index_, _new_, _create_, _show_, _edit_, _update_ e _destroy_.

É considerada uma boa prática se manter o mais fiel ao padrão possível. Como o Rails é um framework
que segue o princípio de Convenção Sobre Configuração, ele fornece mecanismos que nos incentivam a
isso. Ao definir um recurso, as ações e rotas esperadas são geradas automaticamente.

Nós já incluímos as rotas referentes aos livros (`books`) no nosso arquivo de rotas _routes.rb_:

https://github.com/lidimayra/ruby-empowers/blob/ec26b917e5c5073baff834968b52cc81dcfb309e/config/routes.rb#L1-L3

Note o uso de `resources` na definição. Agora execute o comando abaixo no terminal pra listar as
rotas resultantes dessa adição:

```
docker compose run --rm web bin/rails routes -g books
```

Preste atenção ao título e cada coluna e como o conteúdo de cada linha se relaciona.
- O que conseguimos entender disso?
- Qual a relação entre os Verbos HTTP e as Controller Actions listadas?
- Existem actions que se repetem? Se sim, por quê?

Também podemos adicionar a opção `--expanded` para obter mais detalhes:
```
docker compose run --rm web bin/rails routes -g books --expanded
```

Potenciais TODOs:
- HTTP: Request methods e response status codes
- Demonstrar retorno de dados em formato JSON
