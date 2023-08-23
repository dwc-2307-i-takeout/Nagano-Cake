class Public::OrdersController < ApplicationController
  def new
   @order = Order.new
  end

  def create
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    if @order.save
     cart_items.each do |cart|
      order_detail = OrderDetail.new
      order_detail.item_id = cart.item_id
      order_detail.order_id = @order.id
      order_detail.order_quantity = cart.quantity
      order_detail.price = cart.sum_price
      order_detail.save
     end
     redirect_to  public_orders_complete
     cart_items.destroy_all
    else
      @order = Order.new(order_params)
       render :new
    end
  end

   def confirm
      @order = Order.new(order_params)
      if params[:order][:address_number] == "1"
         @order.name = current_customer.name 
         @order.address = current_customer.customer_address
  elsif params[:order][:address_number] == "2"
    if Address.exists?(name: params[:order][:registered])
      @order.name = Address.find(params[:order][:registered]).name
      @order.address = Address.find(params[:order][:registered]).address
    else
      render :new
    end
  elsif params[:order][:address_number] == "3"
    address_new = current_customer.addresses.new(address_params)
    if address_new.save 
    else
      render :new
    end
  else
    redirect_to root_path
  end
  @cart_items = current_customer.cart_items.all
  @total = @cart_items.inject(0) { |sum, item| sum + item.sum_price }

end

private

def order_params
  params.require(:order).permit(:name, :address, :billing_amount)
end

def address_params
  params.require(:order).permit(:name, :address)
end
end