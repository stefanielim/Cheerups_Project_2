class SetDefaultValueForProminenceInCheerup < ActiveRecord::Migration
  def up
    change_column :cheerups, :prominence, :integer, :default => 0
  end

  def down
  end
end
