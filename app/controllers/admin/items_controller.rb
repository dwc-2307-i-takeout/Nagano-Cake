class Admin::ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
    redirect_to admin_item_path
    else
      flash[:item_created_error] = "商品情報が正常に保存されませんでした。"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def item_params
    params.require(:item).permit( :image, :name, :explanation, :price, :genres_id, :is_sale)
  end
end
