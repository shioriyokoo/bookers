class BooksController < ApplicationController
  before_action :set_book, only: [:show, :destroy, :edit, :update]
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :new
    end
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to @book
    else
      @books = Book.all
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id]) # データ（レコード）を1件取得
    book.destroy # データ（レコード）を削除
    flash[:notice] = "Book was successfully destroyed."
    redirect_to '/books' # 投稿一覧画面へリダイレクト
  end

  private
  #  ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
