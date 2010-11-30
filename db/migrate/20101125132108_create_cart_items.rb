class CreateCartItems < ActiveRecord::Migration
  def self.up
    create_table :cart_items do |t|
      t.string  "product_title"
      t.integer "product_id"
      t.integer "quantity"
      t.integer "cart_id"
      t.timestamps
    end
  end

  def self.down
    drop_table :cart_items
  end
end
