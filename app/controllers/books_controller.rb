class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
    # _newとかにして部分テンプレートにしてもいい
    # _new 部分テンプレート、 renderで呼び出すこともできる
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    if @book.save
    flash[:notice] = "Book was successfully created."
    redirect_to book_path(@book.id)
    # redirectはコントローラーを通す
    else
      @books = Book.all
      # コントローラーを通さないので、indexの中身を定義するため
      render 'index'
      # renderはコントローラーを通さない,renderされた後にindex.htmlにいく、if error文に引っかかり表示される
    end
  end

  def edit
    @book = Book.find(params[:id])
    # newの場合インスタンスが空、editの場合すでにデータが入っている。それを判断するためにcontrollerを書き、
    # createアクションかupdateアクションに処理を引き継いでくれる
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to book_path(@book.id)
    else
    render 'edit'
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to books_path
    else
    render 'index'
    end
  end

  private
  def book_params
    # params.require(:book).permit(:title, :body)
    params.require(:book).permit(:title, :body)
    # params.require(:モデル名).permit(:カラム名1, :カラム名2, ...)
    # Strong Parametersを使うと、フォームからのデータを受け取れるようになる
  end

end