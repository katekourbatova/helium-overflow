class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :body, null:false
      t.boolean :is_best, default:false
      t.integer :question_id, null:false
      t.integer :author_id, null:false

      t.timestamps null: false
    end
  end
end
