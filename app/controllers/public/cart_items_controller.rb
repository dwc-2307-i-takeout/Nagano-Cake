class Public::CartItemsController < ApplicationController
  def index
    @cart = Cart.new
    @carts = current_customer.cart_items
  end

  def create
  end



  private
  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :quantity)
  end

end
