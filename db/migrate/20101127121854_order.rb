class Order < ActiveRecord::Migration
  def self.up
     create_table :orders do |t|
      t.string "name"
      t.string "city"
      t.string "street"
      t.integer "h_number"
      t.string "post_code"
      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
