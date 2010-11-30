class CartItem < ActiveRecord::Base
  belongs_to :cart
  
  
  def increment_quantity
    self.quantity+=1
  end
  
end
