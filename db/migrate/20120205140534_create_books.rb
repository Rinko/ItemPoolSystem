class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.integer :publisher
      t.integer :subject
      t.integer :grade
      t.integer :term
      t.string :title

      t.timestamps
    end
  end
end
