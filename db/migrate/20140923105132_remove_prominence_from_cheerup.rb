class RemoveProminenceFromCheerup < ActiveRecord::Migration
  def up
    remove_column :cheerups, :prominence
  end

  def down
    add_column :cheerups, :prominence, :integer
  end
end
