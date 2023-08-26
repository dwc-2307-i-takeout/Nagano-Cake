class Admin::OrdersController < ApplicationController
  def show
  end

  def index
    @customer = Customer.find(params[:id])
    @orders = @customer.orders.page(params[:page])
  end

  private

  def order_params
    params.require(:order).permit(:name, :address, :billing_amount, :post_number, :postage)
  end

  def address_params
    params.require(:order).permit(:name, :address)
  end
end

