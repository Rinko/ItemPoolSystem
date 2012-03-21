class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :hashed_password
      t.string :salt


      t.timestamps
    end
  end
end
