module Api
 module V1
	class PostsController < ApplicationController

respond_to :json
# layout false
#before_action  except: [:index, :show]
# before_action :confirm_logged_in, except: [:index, :show]

def index
  respond_with Post.all
end

def show
	respond_with Post.find(params[:id])
end


def create
	respond_with Post.create(set_params)
end
end

end

private

def set_params

	params.require(:posts).permit(:title, :body, :image)

end
end
