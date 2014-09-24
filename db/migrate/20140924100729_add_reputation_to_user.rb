class AddReputationToUser < ActiveRecord::Migration
  def change
    add_column :users, :reputation, :string, :default => 'Junior_Cheerupper'
  end
end
