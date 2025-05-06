# Models

O model Book já foi criado para esse projeto e está disponível em app/models/book.rb. Nós o geramos
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

## Testes
Para os testes, usaremos o [RSpec](https://rspec.info/).

Já criamos o arquivo de testes para o model Book e o definimos em `spec/models/book_spec.rb`. Abra
o arquivo e mantenha-o lado a lado com o arquivo contendo o nosso model.

A ideia é não alterar a implementação dos testes por enquanto. Queremos implementar a lógica em
Book até que todos os testes passem. Não precisamos nos preocupar com qualidade de código, vamos
focar em implementar o mínimo possível para alcançar o comportamento esperado. Uma vez que os
testes estiverem verdes, podemos considerar melhorias em ambos os lados (tanto nos testes quando
no model).

Todos os testes estão falhando nesse momento já que o model Book está vazio.
Colocamos esses testes em pendência através da adição da linha `pending "Make it pass"` no início de
cada um deles.

Vamos comecar! No primeiro teste do arquivo, onde testamos a validamos de presença do atributo
title, delete a linha que marca a pendência do teste e execute-o:

```
docker compose run --rm web bin/rspec spec/models/book_spec.rb:5
```

Aqui estamos acrescentando um `:5` no final da linha para indicar que estamos exclusivamente
interessadas no teste definido na linha 5 do nosso arquivo. Essa abordagem nos ajudar a manter o
foco apenas no que nos interessa e excluir ruídos.

O teste agora deve estar falhando com a seguinte mensagem de erro exibida em vermelho:

```
 1) Book#validations validates presence of title
     Failure/Error: expect(Book.new).to validate_presence_of :title

       Expected Book to validate that :title cannot be empty/falsy, but this
       could not be proved.
         After setting :title to ‹""›, the matcher expected the Book to be
         invalid, but it was valid instead.
```

Sempre preste muita atenção ao que a mensagem de erro diz (use um tradutor para facilitar se
preferir). Nesse caso, está nos dizendo que mesmo ao usar um valor vazio para o título, o objeto foi
considerado válido, portanto, a validação para o atributo título está funcionando.

Isso faz sentido, dado que nunca a implementamos.

Agora vamos para o código do model.
Implemente o código necessário para que o teste passe.

Material de consulta: [Validações do
ActiveRecord (Guia Rails)](https://guiarails.com.br/active_record_validations.html).

O teste passou? Ótimo.
O seu código agora está testado e você pode se sentir segura para refatora-lo como quiser sem medo
de que a validação quebre. Nesse primeiro exercício, provavelmente não temos muito espaço para
refactor devido a simplicidade do exemplo, mas essa linha de raciocínio será bem-vinda conforme a
complexidade aumentar.

Vamos para o próximo bloco de testes.
Note que eles estão dentro de um bloco definido como `describe "#details"`. Isso indica que os
testes contidos nesse bloco testarão a implementação de um método em Book chamado `details`. Note
que o bloco já está definido, mas por enquanto ainda está vazio. Novamente, vamos repetir um
processo similar ao anterior: remova a linha que marca a pendência do primeiro teste no bloco, rode
o teste, veja-o falhar. Agora direcione o foco para a implementação do método no model e garante que
o teste passe. Uma vez que o teste passar, fique à vontade para aplicar melhorias no código como
preferir.

Faça isso com todos os testes contidos no arquivo `book_spec.rb` até que todos estejam verdes.
Ao final, rode todos eles:

```
docker compose run --rm web bin/rspec spec/models/book_spec.rb
```
