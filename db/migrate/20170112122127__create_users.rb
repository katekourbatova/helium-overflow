class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, :email, :password_hash
      t.timestamps null:false

    end
  end
end
