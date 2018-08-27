class AddAnotherColumnToAdminUser < ActiveRecord::Migration[5.0]
  def up

  add_column("admin_users", "privilege", :boolean)
  end

  def down
  	
  end
end
