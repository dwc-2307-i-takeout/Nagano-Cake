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
      @order.order_details.update_all(making_status: 1) if @order.status == "payment_confirmation"
    end
    redirect_to request.referer
  end

  def confirm
    @order = Order.find(params[:id])
    @total = @order.calculate_total_price

    # フォームの送信に必要な情報を設定
    @order.name = params[:order][:name]
    @order.address = params[:order][:address]
    @order.post_number = params[:order][:post_number]
    @order.postage = params[:order][:postage]
    @order.billing_amount = params[:order][:billing_amount]

    # ビュー内でフォームに表示するためのインスタンス変数を設定
    @cart_items = @order.cart_items
    @all_price = @order.calculate_all_price

    render :confirm
  end

  private

  def order_params
    params.require(:order).permit(:name, :address, :billing_amount, :post_number, :postage, :status)
  end


end

