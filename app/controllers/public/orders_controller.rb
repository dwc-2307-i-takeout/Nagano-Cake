class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def index
    @orders = current_customer.orders.order(created_at: :desc).page(params[:page])
  end

  def show
   @order = current_customer.orders.find(params[:id])
  end

  def create
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)

    if @order.save
      cart_items.each do |cart|
        order_detail = OrderDetail.new
        order_detail.item_id = cart.item_id
        order_detail.order_id = @order.id
        order_detail.quantity = cart.quantity
        order_detail.price = cart.item.tax_included
        order_detail.save
      end

      cart_items.destroy_all
      redirect_to public_orders_complete_path
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    @order.postage = 800
    @all_price = 0
    @cart_items.each do |cart_item|
      @all_price += cart_item.total_price
    end
    @order.billing_amount = @order.postage + @all_price

    if params[:order][:address_number] == "1"
      @order.name = current_customer.family_name + current_customer.first_name
      @order.address = current_customer.address
      @order.post_number = current_customer.post_number
    elsif params[:order][:address_number] == "2"
      if Address.exists?(id: params[:order][:registered])
        @order.name = Address.find(params[:order][:registered]).name
        @order.address = Address.find(params[:order][:registered]).address
        @order.post_number = Address.find(params[:order][:registered]).post_number
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
    @total = @cart_items.inject(0) { |sum, item| sum + item.total_price }
  end

  private

  def order_params
    params.require(:order).permit(:name, :address, :billing_amount, :post_number, :postage, :payment_method)
  end

  def address_params
    params.require(:order).permit(:name, :address, :post_number)
  end
end
