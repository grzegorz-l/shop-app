class OrdersController < ApplicationController
  before_filter :authenticate_admin!
  def index
    @orders = Order.all
  end
  
  def show
    @order = Order.find(params[:id])
    @cart = Cart.find_by_id(@order.cart_id)
  end
end
