class UsersController < BaseController
  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]
  before_action :privileges , except: [:login, :attempt_login, :logout]

  def index
    @users = User.all.order("created_at ASC")
  end

  def show
     @user = User.find(params[:id])
     @name = "majed"
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(set_parametrs)
    if @user.save
      flash[:notice] = "The was created Succesefully"
      redirect_to @user
    else
      flash[:notice] = "There's somthing wrong"
      render 'new'
    end
  end

  def edit
   @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(set_parametrs)
      redirect_to @user
    else
     render 'edit'
    end
  end

  def delete
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private

  def set_parametrs
   params.require(:admin_user).permit(:email, :password, :image, :privilege )
  end
end
