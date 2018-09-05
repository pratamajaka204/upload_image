class AddImageUidToArticles < ActiveRecord::Migration[5.2]
  def change
  	add_column :articles, :image_uid, :string
  end
end
