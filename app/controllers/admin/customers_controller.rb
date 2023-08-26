class Admin::CustomersController < ApplicationController
  def index
   admin_items_new
    @customers = Customer.page(params[:page])
   develop
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "会員情報を変更しました"
      redirect_to admin_customer_path
    else
      render :edit
    end
  end


  def customer_params
    params.require(:customer).permit(:family_name, :first_name, :family_kana_name, :first_kana_name, :email, :post_number, :address, :phone_number, :is_withdrawal)
  end
end
