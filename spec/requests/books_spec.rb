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
      let(:books) { 3.times.map { Fabricate.create(:book) } }

      it "returns the list of books" do
        books # Use books to ensure they are created
        get "/books"
        expect(response.parsed_body.size).to eq 3
      end

      context "when passing language param" do
        it "filters the books list by language" do
          book = Fabricate.create(:book, language: "Portuguese", title: "Úrsula")
          book2 = Fabricate.create(:book, language: "Portuguese", title: "Becos da Memória")
          book3 = Fabricate.create(:book, language: "English", title: "Wuthering Heights")

          get "/books", params: { language: "Portuguese" }
          expect(response.parsed_body.size).to eq 2

          expect(response.body).to include "Úrsula"
          expect(response.body).to include "Becos da Memória"
          expect(response.body).not_to include "Wuthering Heights"
        end
      end

      # Depois que todos os testes acima já tiverem verdes, acrescente novos testes aqui.
      # Escreva testes (e as respectivas funcionalidades no controller) que verifiquem a
      # aceitação de um parâmetro booleano chamado `available`. Se o valor for `true`,
      # verifique que a lista retornada contenha apenas livros cuja quantidade seja maior que 0.
      # Se o valor for `false`, verifique o cenário oposto (apenas livros cuja quantidade seja
      # igual a zero).

      context "when passing available param" do
        it "filters the books list by available" do
          book = Fabricate.create(:book, title: "Úrsula", quantity: 1)
          book2 = Fabricate.create(:book, title: "Becos da Memória", quantity: 0)

          get "/books", params: { available: true }
          expect(response.parsed_body.size).to eq 1
          expect(response.body).to include "Úrsula"
          expect(response.body).not_to include "Becos da Memória"

          get "/books", params: { available: false }
          expect(response.parsed_body.size).to eq 1
        end
      end
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
        book = Fabricate.create(:book, title: "Úrsula")
        get "/books/#{book.id}"
        expect(response).to have_http_status(:success)
      end

      it "returns the book data" do
        book = Fabricate.create(:book, title: "Úrsula")
        get "/books/#{book.id}"
        expect(response.parsed_body["title"]).to eq "Úrsula"
      end
    end

    context "when the book does no exist" do
      # E quando o usuário tentar acessar um livro que não está registrado no nosso banco?
      # Qual seria o código HTTP correto? Fique à vontade para atualizar a descrição do teste abaixo
      # para que se torne mais clara.
      it "returns the correct HTTP status code" do
        get "/books/1"
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe "GET new" do
    it "returns the new book form" do
      get "/books/new"
      expect(response).to have_http_status(:success)
    end

  end

  describe "POST create" do
    it "creates a new book" do
      post "/books", params: { book: { title: "Úrsula", language: "Portuguese", quantity: 1 } }
      expect(response).to have_http_status(:created)
    end
  end

  describe "GET edit" do
    it "returns the edit book form" do
      book = Fabricate.create(:book, title: "Úrsula")
      get "/books/#{book.id}/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH update" do
    it "updates the book" do
      book = Fabricate.create(:book, title: "Úrsula")
      patch "/books/#{book.id}", params: { book: { title: "Úrsula 2" } }
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE destroy" do
    it "deletes the book" do
      book = Fabricate.create(:book, title: "Úrsula")
      delete "/books/#{book.id}"
      expect(response).to have_http_status(:success)
    end
  end
end
