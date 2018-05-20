class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :category
      t.string :page
      t.string :title
      t.string :image
      t.string :link
      t.string :content
      t.timestamps
    end
  end
end
