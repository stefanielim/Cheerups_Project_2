class SetDefaultValueOfProminenceForUser < ActiveRecord::Migration
  def up
    change_column :users, :prominence, :integer, :default => 0
  end

  def down
  end
end
