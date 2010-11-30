class Cart < ActiveRecord::Base
  has_many :cart_items
  belongs_to :order
  
  def add_product(product)
    
    @current_item = CartItem.new(:product_id => product.id, :product_title => product.title, :product_price => product.price, :quantity => 1)

  end

end
