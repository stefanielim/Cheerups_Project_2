class AddProminenceToCheerup2 < ActiveRecord::Migration
  def change
    add_column :cheerups, :prominence, :integer
  end
end
