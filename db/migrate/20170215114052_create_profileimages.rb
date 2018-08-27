class CreateProfileimages < ActiveRecord::Migration[5.0]
  def change
    create_table :profileimages do |t|

      t.attachment :image

      t.timestamps
    end
  end
end
