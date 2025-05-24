require 'rails_helper'

RSpec.describe Book, type: :model do
  # 1. Remova a pendência do teste abaixo e execute-o.
  # Você o verá falhando. Implemente a validação necessária no model Book para fazer com que o teste
  # passe.
  describe "#validations" do
    it "validates presence of title" do
      expect(Book.new).to validate_presence_of :title
    end
  end


  # 2. Remova a pendência dos testes abaixo um de cada vez. Com um único teste falhando, escreva no
  # model somente o código necessário para fazer com o que teste passe.
  describe "#details" do
    subject { book.details }

    context "with publisher" do
      let(:book) { Book.new(title: "Vida de Gato", publisher: "Planeta", language: language) }

      context "with language" do
        let(:language) { "Portuguese" }

        it { is_expected.to eq "Vida de Gato (Planeta) - Portuguese" }
      end

      context "without language" do
        let(:language) { nil }

        it { is_expected.to eq "Vida de Gato (Planeta)" }
      end
    end

    context "without publisher" do
      context "with language" do
        it "includes title and language mentioning unknown publisher" do
          book = Book.new(title: "Vida de Gato", language: "Portuguese")

          expect(book.details).to eq "Vida de Gato (Unknown Publisher) - Portuguese"
        end
      end

      context "without language" do
        it "includes title mentioning unkown publisher" do
          book = Book.new(title: "Vida de Gato")

          expect(book.details).to eq "Vida de Gato (Unknown Publisher)"
        end
      end
    end
  end

  # 3. Escreva aqui os testes que definirão um novo método no model Book. Fique à vontade para dar
  # ao método o nome que preferir. Queremos um método que ao ser invocado, nos informe se um livro
  # foi adquirido pela biblioteca recentemente. Consideramos recente qualquer livro cuja data de
  # cadastro pertença ao período dos últimos 12 meses. Siga o método TDD. Primeiro implemente os
  # testes que verifiquem a funcionalidade desejada. Só então, parta para a implementação do método
  # no model.
end
