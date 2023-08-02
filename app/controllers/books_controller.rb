class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :is_matching_login_user, only: [:edit, :update, :destroy]

  def show
    @book = Book.find(params[:id])
    # @book_comment = BookComment.new
    @book_comment = BookComment.new

  end

  def index
    @books = Book.all
    @book = Book.new

  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] ="You have created book successfully."
      redirect_to book_path(@book)
    else
      @books = Book.all
      render 'index'
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    if @book.update(book_params)
       flash[:notice] ="You have updated book successfully."
      redirect_to book_path(@book)
    else
      render "edit"
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def is_matching_login_user
    @book = Book.find(params[:id])
    unless @book.user == current_user
      redirect_to books_path
    end
    
  end
  
  
  
  #


  # def index
  #   @book = Book.new
  # end

  # def show
  # end
  
  # # 投稿データの保存
  # def create
  #   @book = book.new(post_image_params)
  #   @book.user_id = current_user.id
  #   @book.save
  #   redirect_to book_path
  # end
  
  # # 投稿データのストロングパラメータ
  # private

  # def book_params
  #   params.require(:book).permit(:title, :body)
  # end
end

