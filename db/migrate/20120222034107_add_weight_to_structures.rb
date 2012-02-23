class AddWeightToStructures < ActiveRecord::Migration
  def change
    add_column :structures, :weight, :integer
  end
end
