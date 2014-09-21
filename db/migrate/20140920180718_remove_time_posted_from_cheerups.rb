class RemoveTimePostedFromCheerups < ActiveRecord::Migration
  def up
    remove_column :cheerups, :time_posted
  end

  def down
    add_column :cheerups, :time_posted, :datetime
  end
end
