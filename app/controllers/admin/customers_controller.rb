class Admin::CustomersController < ApplicationController
  def index
    @customer = Customer.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:family_name, :first_name, :family_kana_name, :first_kana_name, :email, :post_number, :address, :phone_number, :is_withdrawal)
  end
end
