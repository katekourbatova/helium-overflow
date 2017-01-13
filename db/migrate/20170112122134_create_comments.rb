class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body
      t.integer :author_id
      t.integer :commentable_id
      t.string :commentable_type

      t.timestamps null:false
  end
end
