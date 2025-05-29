class BooksController < ApplicationController
  def index
    filter_params = params.permit(:language, :available)
    books = Book.where(filter_params.except(:available))

    if params[:available].present?
      available = ActiveModel::Type::Boolean.new.cast(params[:available])
      books = available ? books.where(quantity: 1..) : books.where(quantity: 0)
    end

    render json: books
  end

  def show
    book = Book.find(params[:id])

    render json: book
  end

  def new
    # Aguardando implementação
  end

  def create
    # Aguardando implementação
  end

  def edit
    # Aguardando implementação
  end

  def update
    # Aguardando implementação
  end

  def destroy
    # Aguardando implementação
  end
end
