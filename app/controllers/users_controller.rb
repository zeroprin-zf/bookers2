class UsersController < ApplicationController
  #before_action :is_matching_login_user, only: [:edit, :update]
  def index
    @book = Book.new
    @user = User.all
    @user_s = current_user
  end

  def show
    @book = Book.new #showに遷移した時にrouteエラーが出てた、そもそもアクションが無かったらできん
    @user = User.find(params[:id])
   # @book = Book.find(params[:id])
  end

  def edit
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user)
    end

    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
      #flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)
    #else
      #render :edit_user_path(@user.id)
    #end
  end

  private

   def book_params
    params.require(:book).permit(:title, :body)
   end

   def user_params
     params.require(:user).permit(:name, :profile_image, :introduction)
   end

   #def is_matching_login_user
    #user = User.find(params[:id])
    #unless user.id == current_user.id
     # redirect_to user_path(params[:id])
    #end
   #end
end
