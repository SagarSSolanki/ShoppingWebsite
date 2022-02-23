class CreateCartitems < ActiveRecord::Migration[6.1]
  def change
    create_table :cartitems do |t|
      t.integer :quantity
      t.references :cart, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
