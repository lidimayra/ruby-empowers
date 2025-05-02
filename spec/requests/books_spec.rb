require 'rails_helper'

RSpec.describe "Books", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/books"
      expect(response).to have_http_status(:success)
    end

    context "without books" do
      it "returns the list of books" do
        get "/books"
        expect(response.parsed_body).to be_empty
      end
    end

    context "with books" do
      it "returns the list of books" do
        pending "Make it pass"

        # Cria 3 livros antes da execução do teste
        books = 3.times.map { Book.create(title: "My book") }

        get "/books"
        expect(response.parsed_body.size).to eq 3
      end

      context "when passing language param" do
        it "filters the books list by language" do
          pending "Make it pass"

          # Cria 3 livros antes da execução do teste
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
      # Escreva testes (e as respectivas funcionalidades no controller) que verifiquem a
      # aceitação de um parâmetro booleano chamado `available`. Se o valor for `true`,
      # verifique que a lista retornada contenha apenas livros cuja quantidade seja maior que 0.
      # Se o valor for `false`, verifique o cenário oposto (apenas livros cuja quantidade seja
      # igual a zero).
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/books/1"
      expect(response).to have_http_status(:success)
    end
  end
end
