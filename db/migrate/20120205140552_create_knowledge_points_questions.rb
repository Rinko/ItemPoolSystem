class CreateKnowledgePointsQuestions < ActiveRecord::Migration
  def up
    create_table :knowledge_points_questions, :id => false do|t|
      t.integer :knowledge_point_id
      t.integer :question_id
    end
  end

  def down
    drop_table :knowledge_point_questions
  end
end
