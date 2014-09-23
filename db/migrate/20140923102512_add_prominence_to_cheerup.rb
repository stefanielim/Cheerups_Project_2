class AddProminenceToCheerup < ActiveRecord::Migration
  def change
    add_column :cheerups, :prominence, :integer
  end
end
