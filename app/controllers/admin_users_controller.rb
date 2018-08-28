class AdminUsersController < ApplicationController
   before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]
   before_action :privileges , except: [:login, :attempt_login, :logout]

  def index
  @users = AdminUser.all.order("created_at ASC")
  end

  def login
  	#login_form
  end

def show
    @user = AdminUser.find(params[:id])
    @name = "majed"
end

  def new
    @user = AdminUser.new
  end

  def create
    @user = AdminUser.new(set_parametrs)
    if @user.save
    flash[:notice] = "The was created Succesefully"
    redirect_to @user
else

  flash[:notice] = "There's somthing wrong"
  render 'new'
  end
end

def edit
  @user = AdminUser.find(params[:id])
end

def update
  @user = AdminUser.find(params[:id])
if @user.update(set_parametrs)
redirect_to @user
else
render 'edit'
end
end


  def delete
  @user = AdminUser.find(params[:id])
  end

  def destroy

  @user = AdminUser.find(params[:id])
  @user.destroy
  redirect_to admin_users_path
  end



  def attempt_login
		if params[:username].present? && params[:password].present?

		found_user = AdminUser.where(:username => params[:username]).first
		if found_user
			authorized_user = found_user.authenticate(params[:password])

		end
  	end

  	if authorized_user
		session[:id] = authorized_user.id
		session[:username] = authorized_user.username
    session[:privilege] = authorized_user.privilege

  		flash[:notice] = "Welcom #{ params[:username]}"
  		redirect_to root_path
  	else

  		#flash[:notice] = "Sorry you don't have enough access privileges"
      flash[:notice] = "username or password is not correct"

  		redirect_to :action => 'login'
end

end

  def logout
	session[:id] = nil
	session[:username] = nil
	flash[:notice] = " Good by #{ params[:username]}"
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
  params.require(:admin_user).permit(:username, :email, :password, :image, :privilege )
end

def privileges

  if session[:privilege]
    else
    redirect_to :action => 'login'
  end
end

end
