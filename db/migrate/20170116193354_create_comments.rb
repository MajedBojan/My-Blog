class CreateComments < ActiveRecord::Migration[5.0]
  def up
    create_table :comments do |t|
      t.string :name
      t.text :body
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
 end
