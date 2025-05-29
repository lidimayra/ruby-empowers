require 'rails_helper'

RSpec.describe "Books", type: :request do
  describe "GET index" do
    it "returns http success" do
      get "/books"
      expect(response).to have_http_status(:success)
    end

    context "without books" do
      it "returns an empty list" do
        get "/books"
        expect(response.parsed_body).to be_empty
      end
    end

    context "with books" do
      it "returns the list of books" do
        pending "Make it pass"

        # Cria 3 livros antes da execução do teste.
        # Alternativamente, agora que a fabrication gem já está instalada,
        # poderíamos usá-la para essa finalidade. Uma vez que o teste estiver
        # verde, experimente refatora-lo com essa melhoria.
        # Uma outra sugestão de melhoria aqui seria mover essa variável para
        # um `let`, mantendo o código dentro do bloco `it` mais limpo e
        # legível. Para relembrar, vejam as alterações no PR da aula passada:
        # - https://github.com/lidimayra/ruby-empowers/pull/15
        books = 3.times.map { Book.create(title: "My book") }

        get "/books"
        expect(response.parsed_body.size).to eq 3
      end

      context "when passing language param" do
        it "filters the books list by language" do
          pending "Make it pass"

          # Cria 3 livros antes da execução do teste
          # Assim como no exemplo anterior, aqui também podemos aplicar as
          # mesmas melhorias (uso de fabricators, uso de let)
          book1 = Book.create(title: "Úrsula", language: "Portuguese")
          book2 = Book.create(title: "Becos da Memória", language: "Portuguese")
          book3 = Book.create(title: "Wuthering Heights", language: "English")

          get "/books", params: { language: "Portuguese" }
          expect(response.parsed_body.size).to eq 2

          expect(response.body).to include "Úrsula"
          expect(response.body).to include "Becos da Memória"
          expect(response.body).not_to include "Wuthering Heights"
        end
      end

      # Depois que todos os testes acima já tiverem verdes, acrescente novos testes aqui.
      # 1. Escreva testes (e as respectivas funcionalidades no controller) que verifiquem a
      # aceitação de um parâmetro booleano chamado `available`. Se o valor for `true`,
      # verifique que a lista retornada contenha apenas livros cuja quantidade seja maior que 0.
      # Se o valor for `false`, verifique o cenário oposto (apenas livros cuja quantidade seja
      # igual a zero).

      # 2. Escreva testes (e as respectivas funcionalidades no controller) que verifiquem
      # a quantidade de livros pertencentes a editora Ática. Não se esqueça de adicionar a editora
      # ao fabricar alguns dos livros.
    end
  end

  describe "GET show" do
    # Seguindo na mesma linha, agora queremos testar a rota associada a books#show
    # Preencha os testes abaixo de forma que ao enviar uma GET request para a rota de books#show,
    # retorne os dados do livro. Nesse caso, também deveremos lidar com o cenário em que o usuário
    # tente acessar a rota de um livro não existente.
    #
    # Se precisar de ajuda para relembrar a rota a ser testada, lembre-se de consultar as rotas
    # disponíveis através do `rails routes`.
    # ```
    # docker compose run --rm web bin/rails routes -g books
    # ```

    context "when the book exists" do
      # Lembre que neste contexto, é necessário criar um livro antes de enviar a request.
      it "returns success" do
      end

      it "returns the book data" do
      end
    end

    context "when the book does no exist" do
      # E quando o usuário tentar acessar um livro que não está registrado no nosso banco?
      # Qual seria o código HTTP correto? Fique à vontade para atualizar a descrição do teste abaixo
      # para que se torne mais clara.
      it "returns the correct HTTP status code" do
      end
    end
  end

  describe "GET new" do
  end

  describe "POST create" do
  end

  describe "GET edit" do
  end

  describe "PATCH update" do
  end

  describe "DELETE destroy" do
  end
end
