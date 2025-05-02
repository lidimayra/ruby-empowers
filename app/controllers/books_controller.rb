class BooksController < ApplicationController
  def index
    books = []

    render json: books
  end

  def show
    book = nil

    render json: book
  end
end
