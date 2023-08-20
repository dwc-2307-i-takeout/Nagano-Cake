class Public::RegistrationsController < ApplicationController
  def new
    @customer =Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      # 登録成功時の処理
    else
      render :new
    end
  end
end
