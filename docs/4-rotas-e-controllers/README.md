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

## Controllers

Nos nossos controllers, já temos o esqueleto de `BooksController` definido em
`app/controllers/books_controller.rb`.

Cada método definido no nosso controller corresponde a uma das 7 actions descritas no tópico
anterior e a implementação de cada método estará alinhada com a URL associada a ele que vemos ao
executar o comando `bin/rails routes -g books`. Dessa forma, sabemos por exemplo que a ação
`index` no `BooksController` (`books#index`) estará disponível em http://localhost:3000/books.

Nesse momento, o nosso método `index` está retornando uma lista de elementos em formato JSON.

Para conferir o resultado, experimente abrir o controller no seu editor de texto e altere a
lista temporariamente.

```ruby
  def index
    books = []

    # Crie uma nova lista contendo elementos que você quiser
    fruits = ["morango", "banana", "maçã"]

    # Substitua `books` pelo objeto criado acima
    render json: fruits
  end
```

Agora acesse http://localhost:3000/books no seu navegador (ou em qualquer cliente HTTP que você
preferir) e veja o resultado dos elementos adicionados sendo retornados.

Desfaça essas alterações e deixe o método do jeito que estava. Vamos para os testes.

## Testes de Requisição
Adicionamos também o esqueleto dos testes de requisição
correspondentes em `spec/requests/books_spec.rb`. Abra o arquivo e mantenha-o lado a lado com o
arquivo contendo o nosso controller.

Rode os testes:
```
docker compose run --rm web bin/rspec spec/requests/books_spec.rb
```

Note que os dois primeiros testes já estão passando.
Conseguem identificar o porquê?

Alguns testes já foram escritos definindo o comportamento que esperamos alcançar, porém, como a
implementação no controller ainda não aconteceu, eles estão falhando.

Colocamos esses testes em pendência através da adição da linha `pending "Make it pass"` no início de
cada um deles.

Vamos focar no primeiro teste nessa situação.
No teste descrito como "returns the list of books" (linha 18), delete a linha que marca o teste como
pendente, e execute-o:

```
docker compose run --rm web bin/rspec spec/requests/books_spec.rb:18
```

O teste está falhando. Atualize a action `index` do controller para fazer com que o teste passe.

Passou? Agora vamos pro próximo.
Repita o mesmo processo com o teste abaixo.
Adicione a implementação no controller até que os testes passem. Uma vez que os testes passarem,
fique à vontade pra melhorar o código como preferir (tanto nos testes quanto no controller).

Agora é sua vez de escrever o teste.
O teste seguinte ainda não foi escrito. O arquivo de testes contém um comentário descrevendo a
funcionalidade desejada.

Escreva os testes que representem essa regra e depois escreva a implementação da funcionalidade
até que o teste passe.

