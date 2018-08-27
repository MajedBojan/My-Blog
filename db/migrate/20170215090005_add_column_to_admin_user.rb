class AddColumnToAdminUser < ActiveRecord::Migration[5.0]
  def change
  	  	    add_attachment :admin_users, :image

  end
end
