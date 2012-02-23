class CreateKnowledgePoints < ActiveRecord::Migration
  def change
    create_table :knowledge_points do |t|
      t.text :specific

      t.timestamps
    end
  end
end
