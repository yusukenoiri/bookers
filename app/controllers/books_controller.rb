class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
  end
  
  def create
    book = Book.new(book_params)
    book.save
    redirect_to book_path(book.id)
  end

  def edit
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
    # params.require(:モデル名).permit(:カラム名1, :カラム名2, ...)
    # Strong Parametersを使うと、フォームからのデータを受け取れるようになる
  end
  
end