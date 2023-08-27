class Admin::OrderDetailsController < ApplicationController
  
  def update
    @order = OrderDetail.find(params[:id])
    @order.update(orderdetail_params)
    redirect_to admin_order_path(@order.order.id)
  end
  
  private

  def orderdetail_params
    params.require(:order_detail).permit(:making_status)
  end
end