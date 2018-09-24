class SessionsController < BaseController
  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]
  before_action :privileges , except: [:login, :attempt_login, :logout]

 def login
   #login_form
 end

 def attempt_login
    if params[:email].present? && params[:password].present?
      found_user = User.find_by(:email => params[:email])
    if found_user
      authorized_user = found_user.authenticate(params[:password])
    end
   end

   if authorized_user
   session[:id] = authorized_user.id
   session[:email] = authorized_user.email
  #  session[:privilege] = authorized_user.privilege

     flash[:notice] = "Welcom #{ params[:email]}"
     redirect_to root_path
   else

     #flash[:notice] = "Sorry you don't have enough access privileges"
     flash[:notice] = "email or password is not correct"

     redirect_to :action => 'login'
end

end

  def logout
    session[:id] = nil
    session[:email] = nil
    flash[:notice] = " Good by #{ params[:email]}"
    redirect_to root_path
  end

 def self.sweep(time = 2.minutes)
    if time.is_a?(String)
     time = time.split.inject { |count, unit| count.to_i.send(unit) }
   end
   delete_all "updated_at < '#{time.ago.to_s(:db)}' OR
   created_at < '#{2.days.ago.to_s(:db)}'"
 end

  private

  def set_parametrs
   params.require(:admin_user).permit(:email, :password, :image, :privilege )
  end

  def privileges
   if session[:privilege]
     else
     redirect_to :action => 'login'
   end
  end

end
