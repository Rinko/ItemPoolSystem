class CreateStructuresStudents < ActiveRecord::Migration
  def up
    create_table :structures_students, :id => false do|t|
      t.integer :structure_id
      t.integer :student_id
    end
  end

  def down
    drop_table :structure_students
  end
end
