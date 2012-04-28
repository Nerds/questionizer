class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :category
      t.string :sub_category
      t.integer :nerd_level
      t.string :text
      t.string :a1
      t.string :a2
      t.string :a3
      t.string :a4
      t.string :right_answer
      t.string :creator
      t.string :creator_twitter
      t.string :creator_github
      t.integer :user_id

      t.timestamps
    end
  end
end
