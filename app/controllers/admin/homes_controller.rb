class Admin::HomesController < ApplicationController
  def top
     @orders = Order.page(params[page])
  end

  private

  def order_params
    params.require(:order).permit(:name, :address, :billing_amount, :post_number, :postage)
  end

  def address_params
    params.require(:order).permit(:name, :address)
  end
end
