class AddCheerupImageToCheerups < ActiveRecord::Migration
  def change
    add_column :cheerups, :cheerup_image, :string
  end
end
