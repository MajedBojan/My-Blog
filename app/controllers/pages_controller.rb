class PagesController < BaseController

	def index
	end

	def new
	  @page = Page.new
	end

	def create
		@page = Page.new(set_parametrs)
		if @page.save
		redirect_to @page
		else
		 redirect_to root_path
		end
end

def show
	@page = Page.find(params[:id])
end


def edit
	@page = Page.find(params[:id])

end

def update
@page = Page.find(params[:id])
if @page.update(set_parametrs)
	redirect_to @page
else
	render 'edit'
end

end

private

def set_parametrs

params.require(:page).permit(:title, :body, :image)

end
end
