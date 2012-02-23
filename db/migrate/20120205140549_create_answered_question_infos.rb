class CreateAnsweredQuestionInfos < ActiveRecord::Migration
  def change
    create_table :answered_question_infos do |t|
      t.references :student
      t.references :question
      t.boolean :right_or_wrong
      t.string :wrong_answer

      t.timestamps
    end
    add_index :answered_question_infos, :student_id
    add_index :answered_question_infos, :question_id
  end
end
