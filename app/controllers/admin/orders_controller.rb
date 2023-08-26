class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end
  
  def index
    @orders = Order.all
  end
  
   def update
      @order = Order.find(params[:id])
     if @order.update(order_params)
      redirect_to  admin_order_path(@order)
     else
      render :show
     end
   end
  
  private

  def order_params
    params.require(:order).permit(:name, :address, :billing_amount, :post_number, :postage, :status)
  end

  def address_params
    params.require(:order).permit(:name, :address)
  end
end

