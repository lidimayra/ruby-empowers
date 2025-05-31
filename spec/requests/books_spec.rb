require 'rails_helper'

RSpec.describe "Books", type: :request do
  describe "GET index" do
    subject(:get_books) { get "/books", params: params }

    let(:params) { {} }

    it "returns http success" do
      get_books
      expect(response).to have_http_status(:success)
    end

    context "without books" do
      it "returns an empty list" do
        get_books
        expect(response.parsed_body).to be_empty
      end
    end

    context "with books" do
      it "returns the list of books" do
        # Cria 3 livros antes da execução do teste.
        # Alternativamente, agora que a fabrication gem já está instalada,
        # poderíamos usá-la para essa finalidade. Uma vez que o teste estiver
        # verde, experimente refatora-lo com essa melhoria.
        # Uma outra sugestão de melhoria aqui seria mover essa variável para
        # um `let`, mantendo o código dentro do bloco `it` mais limpo e
        # legível. Para relembrar, vejam as alterações no PR da aula passada:
        # - https://github.com/lidimayra/ruby-empowers/pull/15
        Fabricate.times(3, :book)

        get_books
        expect(response.parsed_body.size).to eq 3
      end

      context "when passing language param" do
        let(:params) { { language: "Portuguese" } }

        it "filters the books list by language" do
          # Cria 3 livros antes da execução do teste
          # Assim como no exemplo anterior, aqui também podemos aplicar as
          # mesmas melhorias (uso de fabricators, uso de let)
          book1 = Fabricate(:book, title: "Úrsula")
          book2 = Fabricate(:book, title: "Becos da Memória")
          book3 = Fabricate(:english_book, title: "Wuthering Heights")

          get_books
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
      context "when passing available param" do
        let!(:book1) { Fabricate :unavailable_book, title: "Fim" }
        let!(:book2) { Fabricate :unavailable_book, title: "Desesterro" }
        let!(:book3) { Fabricate :available_book, title: "Convite à Filosofia" }

        context "when available is true" do
          let(:params) { { available: true } }
          it "returns the list of books with a quantity greater than 0" do
            get_books

            expect(response.parsed_body.size).to eq 1

            expect(response.body).to include "Convite à Filosofia"

            expect(response.body).not_to include "Fim"
            expect(response.body).not_to include "Desesterro"
          end
        end

        context "when available is false" do
          let(:params) { { available: false } }

          it "returns the list of books with a quantity equal to 0" do
            get_books

            expect(response.parsed_body.size).to eq 2

            expect(response.body).not_to include "Convite à Filosofia"

            expect(response.body).to include "Fim"
            expect(response.body).to include "Desesterro"
          end
        end
      end

      # 2. Escreva testes (e as respectivas funcionalidades no controller) que verifiquem
      # a quantidade de livros pertencentes a editora Ática. Não se esqueça de adicionar a editora
      # ao fabricar alguns dos livros.
      context "when passing a publisher as param" do
        let(:params) { { publisher: "Ática" } }

        let!(:book1) { Fabricate :book, publisher: "Ática" }
        let!(:book2) { Fabricate :book, publisher: "Oito e meio" }

        it "returns only the books with Ática registered as publisher" do
          get_books

          expect(response.parsed_body.size).to eq 1
          expect(response.parsed_body.first["publisher"]).to eq "Ática"
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
    subject(:get_book) { get "/books/#{book_id}" }

    context "when the book exists" do
      # Lembre que neste contexto, é necessário criar um livro antes de enviar a request.
      let!(:book) { Fabricate :book }
      let(:book_id) { book.id }

      it "returns success" do
        get_book

        expect(response).to have_http_status :success
      end

      it "returns the book data" do
        get_book

        expect(response.parsed_body["title"]).to eq book.title
        expect(response.parsed_body["language"]).to eq book.language
        expect(response.parsed_body["quantity"]).to eq book.quantity
      end
    end

    context "when the book does no exist" do
      let(:book_id) { "239023" }
      # E quando o usuário tentar acessar um livro que não está registrado no nosso banco?
      # Qual seria o código HTTP correto? Fique à vontade para atualizar a descrição do teste abaixo
      # para que se torne mais clara.
      it "returns not found" do
        get_book
        expect(response).to have_http_status :not_found
      end
    end
  end

  describe "GET new" do
  end

  describe "POST create" do
    subject(:post_create) { post "/books", params: params }

    context "with an invalid params" do
      let(:params) { { book: { author: "Alice Walker" } } }

      it "returns an error" do
        post_create
        expect(response).to have_http_status(:unprocessable_content)
      end

      it "does not create a book" do
        expect { post_create }.not_to change(Book, :count)
      end
    end

    context "with valid params" do
      let(:params) { { book: Fabricate.attributes_for(:book) } }

      it "returns success" do
        post_create
        expect(response).to have_http_status(:created)
      end

      it "creates a book" do
        expect { post_create }.to change(Book, :count).from(0).to(1)
      end

      it "assigns the passed params to the created book" do
        post_create

        expect(response.parsed_body["title"]).to eq params[:book][:title]
        expect(response.parsed_body["language"]).to eq params[:book][:language]
        expect(response.parsed_body["quantity"]).to eq params[:book][:quantity]
        expect(response.parsed_body["publisher"]).to eq params[:book][:publisher]
      end
    end
  end

  describe "GET edit" do
  end

  describe "PATCH update" do
    subject(:patch_update) { patch "/books/#{book.id}", params: params }

    context "when the book exists" do
      let(:book) { Fabricate :available_book }

      context "with valid params" do
        let(:params) { { book: { quantity: 0 } } }

        it "returns success" do
          patch_update
          expect(response).to have_http_status(:ok)
        end

        it "updates the book data" do
          expect { patch_update && book.reload }.to change(book, :quantity).from(5).to(0)
        end
      end

      context "with invalid params" do
        let(:params) { { book: { title: nil } } }

        it "returns error" do
          patch_update
          expect(response).to have_http_status(:unprocessable_content)
        end
      end
    end

    context "when the book does not exist" do
      let(:book) { Fabricate.build :book }
      let(:params) { { book: { quantity: 0 } } }

      it "returns 404" do
        patch_update
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe "DELETE destroy" do
    subject(:delete_destroy) { delete "/books/#{book.id}" }

    context "when the book exists" do
      let!(:book) { Fabricate :book }

      it "returns success" do
        delete_destroy
        expect(response).to have_http_status(:success)
      end

      it "destroys the record" do
        expect { delete_destroy }.to change(Book, :count).from(1).to(0)
      end
    end

    context "when the book does not exist" do
      let(:book) { Fabricate.build(:book) }

      it "returns not found" do
        delete_destroy
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
