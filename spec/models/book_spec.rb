require 'rails_helper'

# Todos os testes estão falhando nesse momento já que o model Book está vazio.
# A ideia é não alterar a implementação dos testes por enquanto. Queremos implementar a lógica em
# Book até que todos os testes passem. Não precisamos nos preocupar com qualidade de código, vamos
# focar em implementar o mínimo possível para alcançar o comportamento esperado. Uma vez que os
# testes estiverem verdes, podemos considerar melhorias em ambos os lados (tanto nos testes quando
# no model)

RSpec.describe Book, type: :model do
  describe "#validations" do
    it { expect(Book.new).to validate_presence_of :title }
  end

  describe "#details" do
    context "with publisher" do
      context "with language" do
        it "includes title, publisher and language" do
          book = Book.new(title: "Vida de Gato", publisher: "Planeta", language: "Portuguese")

          expect(book.details).to eq "Vida de Gato (Planeta) - Portuguese"
        end
      end

      context "without language" do
        it "includes title and publisher" do
          book = Book.new(title: "Vida de Gato", publisher: "Planeta")

          expect(book.details).to eq "Vida de Gato (Planeta)"
        end
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
end
