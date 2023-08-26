class Admin::ItemsController < ApplicationController
  def index
    if params[:search]
      @search_item = Item.search(params[:search])
      @items = @search_item.page(params[:page])
    else
      @items = Item.page(params[:page])
    end
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path
    else
      flash[:item_created_error] = "商品情報が正常に保存されませんでした。"
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :price, :genre_id, :is_sale)
  end
end