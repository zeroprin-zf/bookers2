class UsersController < ApplicationController
  def index
    @user = User.all
    @user_s = current_user
  end

  def show
    @user = current_user
   # @book = Book.find(params[:id])
  end

  def edit
  end

  private

   def book_params
    params.require(:book).permit(:title, :body)
   end

end
