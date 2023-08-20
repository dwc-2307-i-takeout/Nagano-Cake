class Public::SessionsController < ApplicationController
  def new
  end

  def create
    customer = Customer.find_by(email: params[:email])
    if customer && customer.authenticate(params[:password])
      session[:customer_id] = customer.id
      # ログイン成功時の処理
    else
      render :new
    end
  end
end
