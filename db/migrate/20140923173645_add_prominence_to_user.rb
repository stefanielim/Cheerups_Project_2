class AddProminenceToUser < ActiveRecord::Migration
  def change
    add_column :users, :prominence, :integer
  end
end
