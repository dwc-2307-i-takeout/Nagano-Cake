class Public::OrdersController < ApplicationController
  def new
  end

  def index
    @orders = current_customer.orders.latest
  end

  def show
    @order = current_customer.orders.find(params[:id])
  end

  def complete
  end
end
