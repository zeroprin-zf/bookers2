class BooksController < ApplicationController
 before_action :is_matching_login_user, only: [:edit, :update, :destroy]
  def new
    @book = Book.new
  end

  def index
    @book = Book.new
    @books = Book.all
    #@book_a = Book.find(params[:id])
    @user = current_user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)#遷移画面はホームに近い
    else
      render :books_path
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
     flash[:notice] = "You have updated user successfully."
     redirect_to book_path(book.id)
    else
     render :edit
    end
  end


  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
   def book_params
    params.require(:book).permit(:title, :body)
   end

   #def is_matching_login_user
    #book = Book.find(params[:id])
    #unless user.id == current_user.id
     # redirect_to book_path(params[:id])
    #end
   #end
end
