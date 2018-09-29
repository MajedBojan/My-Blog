class ContactsController < BaseController
  def index
    @contacts = Contact.all.order('created_at DESC')
  end


  def show
    @contact = Contact.find(params[:id])
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    if @contact.update(contact_params)
      redirect_to @contact
    else
      render new
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    #redirect_to posts_path
    redirect_to contacts_path
  end

  def contact_params
    params.require(:contact).permit(:title, :message)
  end
end
