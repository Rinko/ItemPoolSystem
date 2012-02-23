class CreateStructures < ActiveRecord::Migration
  def change
    create_table :structures do |t|
      t.references :book
      t.integer :unit
      t.integer :chapter
      t.string :title
      t.references :parent

      t.timestamps
    end
    add_index :structures, :book_id
    add_index :structures, :parent_id
  end
end
