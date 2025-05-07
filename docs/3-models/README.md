# Models

O model Book já foi criado para esse projeto e está disponível em app/models/book.rb. Nós o criamos
com o gerador automático fornecido pelo Rails:

```
docker compose run --rm web bin/rails g model book
```

O gerador nos auxilia com a definição básica para o model e a respectiva migração responsável por
criar a tabela no banco de dados. Cada objeto criado como uma instância da classe book é persistido
na tabela `books`.

Estipulamos aqui que cada livro pode ter os seguintes atributos:
- Título (title)
- Editora (publisher)
- Idioma (language)
- Quantidade (quantity)

Podemos usar o Rails console para criar e consultar alguns livros.
No terminal de comando, abra o console com o seguinte comando:

```
docker compose run --rm web bin/rails c
```

No console, experimente criar um livro:

```
> book = Book.new
> book.title = "<insira aqui o título que quiser>"
> book.publisher = "<insira aqui o nome de uma editora>"
> book.language = "<insira aqui o idioma>"
> book.quantity = "<insira aqui um número inteiro correspondendo a quantidade de livros>"
> book.save
```

Após executar o comando `book.save`, confira se o valor retornado corresponde a `true` - isso
significa que o objeto foi salvo corretamente.

Note que ao rodar o comando para o setup do banco de dados especificado no README inicial do
projeto, nós também populamos automaticamente alguns livros no banco de dados. Agora podemos
consultar esses livros no console. Experimente executar alguns comandos e preste atenção aos
resultados obtidos.

Sugestões de comandos:
- `Book.count`
- `Book.first`
- `Book.pluck(:title)`
- `Book.find_by(language: "Portuguese")`
- `Book.where(language: "Portuguese")`

Seguindo essa linha, tente encontrar as respostas para as seguintes perguntas:

- Quantos livros registrados estão escritos em Português?
- Quantos livros registrados estão escritos em idiomas estrangeiros?
- Quantos livros encontram-se indisponíveis?
- Quais os títulos dos livros que se encontram indisponíveis?
- Existe algum livro publicado pela editora Ática disponível para empréstimo?

Material de consulta: [Recuperando Objetos do Banco de Dados(Guia Rails)](https://guiarails.com.br/active_record_querying.html#recuperando-objetos-do-banco-de-dados).
