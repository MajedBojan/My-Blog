class ProfileimagesController < ApplicationController
  def index
  end

  def show
    @profile = Profileimage.find(params[:id])
  end

  def new
    @profile = Profileimage.new
  end

  def create
  @profile = Profileimage.new(set_image)
  if @profile.save
    redirect_to @profile
  else
    render 'new'
end
end

  def edit
  @profile = Profileimage.find(params[:id])
  end

def update
  @profile = Profileimage.find(params[:id])
if @profile.update(set_image)
redirect_to @profile
  else
    render 'edit'
end

end

  private

  def set_image
    params.require(:profileimage).permit(:image)
  end
end
