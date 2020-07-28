class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :body
      t.text :opinion
      t.string :posts_image_id

      t.timestamps
    end
  end
end
