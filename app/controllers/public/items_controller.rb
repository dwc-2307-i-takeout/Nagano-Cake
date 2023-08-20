class Public::ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart_new = CartItem.new
  end

  def index
    @items=Item.all
  end
end
