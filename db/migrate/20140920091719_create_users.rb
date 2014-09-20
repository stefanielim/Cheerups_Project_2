class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name , :null => false
      t.string :user_name , :null => false
      t.string :status , :default => 'active'
      t.string :role, :default => 'user'
      t.timestamps
    end
  end
end
