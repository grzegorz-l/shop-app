class StoreController < ApplicationController
  def index
    @products = Product.all
  end
  
  def cart
    @cart = Cart.find_by_id(session[:cart_id])
  end

  def add_to_cart
    
    if session[:cart_id]
      @cart = Cart.find_by_id(session[:cart_id])
      product = Product.find(params[:id])
      @cart_item = @cart.cart_items.find_by_product_id(product.id)
      if @cart_item
        @cart_item.quantity+=1
        @cart_item.save
      else
        @cart_item = @cart.add_product(product)
        @cart.cart_items << @cart_item
       end
      redirect_to store_index_path
    else
      @cart = Cart.new
      @cart.save
      session[:cart_id] = @cart.id
      product = Product.find(params[:id])
      @cart_item = @cart.add_product(product)
      @cart_item.save
      @cart.cart_items << @cart_item
      redirect_to store_index_path
    end
  end
  
  def empty_cart
    @cart = Cart.find_by_id(session[:cart_id])
    @cart.cart_items.each do |item|
      item.destroy
    end
  
    redirect_to store_index_path
  end
  
  def checkout
    @cart = Cart.find_by_id(session[:cart_id])
    if @cart.cart_items.empty?
      redirect_to store_index_path
    else
      @order = Order.new
    end
  end
  
  def save_order
    @order = Order.new(params[:order]) 
    @order.cart_id =  session[:cart_id]
    if @order.save                     
      session[:cart_id] = nil
      redirect_to store_index_path
    else
      render :action => 'checkout'
    end
  end

end
