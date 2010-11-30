class Product < ActiveRecord::Base
  belongs_to :cart_item
end
