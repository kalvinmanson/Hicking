class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  WillPaginate.per_page = 30

  private
  def es_user
  	if !user_signed_in?
  		redirect_to new_user_session_path
    end
  end

  private
  def es_admin
  	if !user_signed_in? || current_user.rol != "Admin"
      flash[:error] = "unauthorized access"
  		redirect_to new_user_session_path
  	end
  end
end
