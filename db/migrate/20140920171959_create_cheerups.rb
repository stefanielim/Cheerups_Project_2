class CreateCheerups < ActiveRecord::Migration
  def change
    create_table :cheerups do |t|
      t.text :content
      t.datetime :time_posted
      t.references :user

      t.timestamps
    end
    add_index :cheerups, :user_id
  end
end
