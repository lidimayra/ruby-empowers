class BooksController < ApplicationController
  def index
    books = Book.all
    books = books.where(language: params[:language]) if params[:language].present?
    books = books.where(quantity: 0) if params[:available] == "false"
    books = books.where("quantity > 0") if params[:available] == "true"

    render json: books
  end

  def show
    book = Book.find(params[:id])
    render json: book
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Book not found" }, status: :not_found
  end

  def new
    render json: { message: "New book form" }
  end

  def create
    book = Book.create(book_params)
    render json: book, status: :created
  end

  def edit
    book = Book.find(params[:id])
    render json: book
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Book not found" }, status: :not_found
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    render json: book
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Book not found" }, status: :not_found
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    render json: { message: "Book deleted" }, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Book not found" }, status: :not_found
  end

  private

  def book_params
    params.require(:book).permit(:title, :language, :quantity)
  end
end
