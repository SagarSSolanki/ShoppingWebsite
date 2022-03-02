class SetDefault < ActiveRecord::Migration[6.1]
  def up
    change_column :carts, :total, :integer, default: 0
  end
  
  def down
    change_column :carts, :total, :integer, default: false
  end
end
