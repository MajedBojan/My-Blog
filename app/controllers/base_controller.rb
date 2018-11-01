class BaseController < ApplicationController
  # before_action :authenticate_user!
  protect_from_forgery with: :exception
  #  before_action :get_profile_image

private

  def confirm_logged_in
    unless session[:id]
      flash[:notice] = "Sorry you don't have enough access privileges"
      redirect_to(:controller => 'sessions', :action => 'login')
      # redirect_to(:controller => 'users', :action => 'login')
    return false #halts the before_action
    else
    return true

    end
  end
end
