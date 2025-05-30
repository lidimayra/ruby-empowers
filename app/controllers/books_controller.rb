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
    # As ações new e edit não fazem tanto sentido na atividade em que estamos
    # considerando apenas o retorno de dados em formato json.
    # As mantivemos aqui porque elas serão úteis ao trabalhar com views.
  end

  def create
    book = Book.create!(book_params)

    render json: book, status: 201
  end

  def edit
    # As ações new e edit não fazem tanto sentido na atividade em que estamos
    # considerando apenas o retorno de dados em formato json.
    # As mantivemos aqui porque elas serão úteis ao trabalhar com views.
  end

  def update
    book = Book.find(params[:id])
    book.update!(book_params)

    render json: book
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy

    render json: book
  end

  private

  def book_params
    params.require(:book).permit(:title, :language, :quantity, :publisher)
  end
end
