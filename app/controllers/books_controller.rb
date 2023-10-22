class BooksController < ApplicationController
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
    @user = current_user#showに遷移した時にrouteエラーが出てた
    @book.user_id = current_user.id#showに遷移した時にrouteエラーが出てた
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)#book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def edit
    book = Book.find(params[:id])
    unless book.user == current_user #エラー出るかも
      redirect_to  books_path
    end
    @book = Book.find(params[:id])

  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
     flash[:notice] = "You have updated user successfully."
     redirect_to book_path(@book.id)#なんでこうなる？
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


end
