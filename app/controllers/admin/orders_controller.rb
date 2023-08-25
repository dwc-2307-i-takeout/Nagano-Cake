class Admin::OrdersController < ApplicationController
  def show
  end
  
  def index
    @orders = Order.all
  end
  
  private

  def order_params
    params.require(:order).permit(:name, :address, :billing_amount, :post_number, :postage)
  end

  def address_params
    params.require(:order).permit(:name, :address)
  end
end

