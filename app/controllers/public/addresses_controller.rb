class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_correct_customer, only: [:edit]

  def index
    @address = Address.new
    @addresses = current_customer.addresses.all
    #@addresses = current_customer.addresses
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    address = Address.new(address_params)
    address.customer_id = current_customer.id
    address.save
    redirect_to public_addresses_path
  end

  def update
    address = Address.find(params[:id])
    address.update(address_params)
    redirect_to public_addresses_path
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to public_addresses_path
  end

  private
  def address_params
    params.require(:address).permit(:post_number, :address, :name)
  end

  def ensure_correct_customer
    @address = Address.find(params[:id])
    unless @address.customer == current_customer
      redirect_to public_addresses_path
    end
  end
end
