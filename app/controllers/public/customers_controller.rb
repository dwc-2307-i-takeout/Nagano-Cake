class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
     @customer = current_customer
  end

  def update
     @customer = current_customer
     if @customer.update(customer_params)
      redirect_to  public_customers_mypage_path
     else
      render :edit
     end
  end

  def confirm
  end
   private

  def customer_params
    params.require(:customer).permit(:family_name, :first_name, :family_kana_name, :first_kana_name, :email, :post_number, :address, :phone_number, :is_withdrawal)
  end
end
