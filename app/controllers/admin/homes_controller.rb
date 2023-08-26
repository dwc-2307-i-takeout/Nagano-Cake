class Admin::HomesController < ApplicationController
  def top
     @orders = Order.page(params[:page]).order(created_at: "DESC")
     @quantity = 0
  end

  private

  def order_params
    params.require(:order).permit(:name, :address, :billing_amount, :post_number, :postage)
  end

end
