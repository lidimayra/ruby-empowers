require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "#validations" do
    it "validates presence of title" do
      pending "Make it pass"

      expect(Book.new).to validate_presence_of :title
    end
  end

  describe "#details" do
    context "with publisher" do
      context "with language" do
        it "includes title, publisher and language" do
          pending "Make it pass"

          book = Book.new(title: "Vida de Gato", publisher: "Planeta", language: "Portuguese")

          expect(book.details).to eq "Vida de Gato (Planeta) - Portuguese"
        end
      end

      context "without language" do
        it "includes title and publisher" do
          pending "Make it pass"

          book = Book.new(title: "Vida de Gato", publisher: "Planeta")

          expect(book.details).to eq "Vida de Gato (Planeta)"
        end
      end
    end

    context "without publisher" do
      context "with language" do
        it "includes title and language mentioning unknown publisher" do
          pending "Make it pass"

          book = Book.new(title: "Vida de Gato", language: "Portuguese")

          expect(book.details).to eq "Vida de Gato (Unknown Publisher) - Portuguese"
        end
      end

      context "without language" do
        it "includes title mentioning unkown publisher" do
          pending "Make it pass"

          book = Book.new(title: "Vida de Gato")

          expect(book.details).to eq "Vida de Gato (Unknown Publisher)"
        end
      end
    end
  end
end
