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
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

   def book_params
    params.require(:book).permit(:title, :body)
   end
   
   def user_params
     params.require(:user).permit(:name, :profile_image, :introduction)
   end
end
