class CreateKnowledgePointInfos < ActiveRecord::Migration
  def change
    create_table :knowledge_point_infos do |t|
      t.references :student
      t.references :knowledge_point
      t.integer :level

      t.timestamps
    end
    add_index :knowledge_point_infos, :student_id
    add_index :knowledge_point_infos, :knowledge_point_id
  end
end
