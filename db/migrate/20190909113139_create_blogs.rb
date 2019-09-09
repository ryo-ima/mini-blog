class CreateBlogs < ActiveRecord::Migration[5.0]
  def change
    create_table :blogs do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.string :image
      t.references :user, null:false, foreign_key: true
      t.timestamps
    end
  end
end