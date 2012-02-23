class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :question
      t.text :answer
      t.string :resource_ids
      t.integer :difficulty
      t.boolean :if_judge

      t.timestamps
    end
  end
end
