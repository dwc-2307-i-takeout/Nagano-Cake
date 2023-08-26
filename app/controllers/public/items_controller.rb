class Public::ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart_new = CartItem.new
  end

  def index
    @genres = Genre.all
    if params[:genre_id]
      @item_genre = Genre.find(params[:genre_id]).items
      @items = @item_genre.page(params[:page]).per(8)
      @items_count = @item_genre.count
    elsif params[:search]
      @search_item = Item.search(params[:search])
      @items = @search_item.page(params[:page]).per(8)
      @items_count = @items.count
    else
      @items = Item.page(params[:page]).per(8)
      @items_count = Item.count
    end
  end

end
