# Introdução ao TDD

## O que é TDD
TDD é a sigla para "Test-Driven Development" - Desenvolvimento Orientado a Testes. 
É uma abordagem onde você escreve os testes antes mesmo de escrever o código que será testado. 
O TDD pode ser dividido em 3 etapas: 
1- Escrever um teste que define o que o seu código deveria fazer
2- Escrever o código mais simples possível para fazer o teste passar
3- Melhorar o código, mantendo o seu teste passando

Esse tipo de abordagem resulta em códigos mais confiáveis e com menos defeitos.

## Comandos para rodar os testes
Para rodar todos os testes do arquivo:
```
docker compose run --rm web bin/rspec spec/models/book_spec.rb
```
Para rodar um teste específico (nesse exemplo, roda o teste presente na linha 5)
```
docker compose run --rm web bin/rspec spec/models/book_spec.rb:5
```
Para trazer o resultado dos testes num formato diferente use o `--format`. Nesse exemplo, nossos testes vão rodar em formato de documentação:
```
docker compose run --rm web bin/rspec spec/models/book_spec.rb --format=documentation
```
Mais informações sobre formatos [aqui](https://rspec.info/features/3-13/rspec-core/command-line/format-option/).

## Praticando

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

Depois disso, é a sua vez de escrever o próximo teste do zero. O arquivo de testes contém um
comentário sugerindo a escrita de um novo teste e a respectiva implementação no model.

Ao final, rode todos eles:

```
docker compose run --rm web bin/rspec spec/models/book_spec.rb
```
