class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id, index: true, foreign_key: true
      t.boolean :value
      t.string :voteable_type
      t.integer :voteable_id

      t.timestamps
    end
  end
end
