# Views
No padrão MVC (Model-View-Controller) do Rails, as views são responsáveis pela apresentação dos dados ao usuário. 

Para o nosso projeto trabalharemos com duas principais views: index e show. 

Para os passos seguir, precisamos garantir que os controller se mantenha no estado em que deixamos no exercício
anterior. É necessário que o BooksController defina corretamente as variáveis de instância (para que possam ser
acessadas nas views) e que as views sejam renderizadas (que as actions não retornem objetos json).

## Index
A view `index` é a página inicial de apresentação de um modelo, normalmente ela exibe uma lista de registros. 
No nosso caso, nossa view "index.html.erb" deve exibir todos os livros cadastrados no nosso sistema. 

## Show
A view `show` exibe os detalhes de um registro específico. Ao clicar em um dos livros da nossa lista, devemos
exibir os detalhes relacionados à ele. Nós só colocamos o título e um link que retorna pra lista de livros até agora.

## Uso do Tailwind como framework CSS

O Tailwind é um framework quem vem crescendo em popularidade. Sua principal característica é o foco nas classes
utilitárias. A seguir, o instalaremos aqui para compor o estilo das views:

```
docker compose run --rm web bundle add tailwindcss-rails
docker compose build
docker compose run --rm web bin/rails tailwindcss:install
```

Abra o arquivo `books/index.html.erb` e acesse também a respectiva página no navegador:
http://localhost:3000/books.


Queremos construir um estilo simples fazendo o uso do Tailwind.
Substitua o código existente na view pelo código abaixo:

```
<div class="flex flex-col">
  <h1 class="text-4xl text-center text-gray-600 p-2">Books</h1>

  <table class="border-separate border border-green-800">
    <thead>
      <tr>
        <th class="border-separate border border-green-900 p-2">Title</th>
        <th class="border-separate border border-green-900 p-2">Publisher</th>
        <th class="border-separate border border-green-900 p-2">Language</th>
        <th class="border-separate border border-green-900 p-2">Quantity</th>
      </tr>
    </thead>

    <tbody>
      <% @books.each do |book| %>
        <tr class="border-separate border border-green-900">
          <td class="border-separate border border-green-900 p-2"><%= book.title %></td>
          <td class="border-separate border border-green-900 p-2"><%= book.publisher %></td>
          <td class="border-separate border border-green-900 p-2"><%= book.language %></td>
          <td class="border-separate border border-green-900 p-2"><%= book.quantity %></td>
        </tr>
      <% end %>
    </tbody>
  </table>
</div>
```

Para discussão: Por que o Tailwind tem ganho tanta força como framework CSS? O que podemos perceber de diferente nele em relação a outros frameworks CSS?

Referências:
- A documentação do Tailwind pode ser acessada em: https://v2.tailwindcss.com/docs
- Há também outras bibliotecas e frameworks construídos em cima do Tailwind, que oferecem mais uma camada de abstração ao fornecer componentes
reutilizáveis. Exemplo: [Flowbite](https://flowbite.com/).

## Exercícios adicionais
- Como poderiamos fazer para criar uma `view` de criação de novos livros?
- Como poderíamos criar uma `view` de edição? 

Material de consulta que pode ajudar com os exercícios: [Action View Form Helpers](https://guiarails.com.br/form_helpers.html).
