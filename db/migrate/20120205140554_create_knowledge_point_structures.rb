class CreateKnowledgePointStructures < ActiveRecord::Migration
  def up
    create_table :knowledge_points_structures, :id => false  do |t|
      t.integer :knowledge_point_id
      t.integer :structure_id
    end
  end

  def down
    drop_table :knowledge_point_structures
  end
end
