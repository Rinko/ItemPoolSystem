class CreateParameters < ActiveRecord::Migration
  def change
    create_table :parameters do |t|
      t.integer :key
      t.string :value
      t.references :parent

      t.timestamps
    end
    add_index :parameters, :parent_id
  end
end
