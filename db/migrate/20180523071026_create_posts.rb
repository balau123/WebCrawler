class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :category
      t.text :page
      t.text :title
      t.text :image
      t.text :link
      t.text :content
      t.text :contentVerbose

      t.timestamps
    end
  end
end
