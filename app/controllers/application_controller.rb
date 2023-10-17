class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

 def after_sign_in_path_for(resource)#サインイン後に何処に遷移するかだからindexにしたい
   users_path
 end

 def after_sign_out_path_for(resource)#サインアウト後にどこに遷移するかだからログイン画面にしたい
   root_path
 end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end