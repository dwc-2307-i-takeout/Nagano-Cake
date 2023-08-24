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
      @items = @item_genre.page(params[:page])
      @items_count = @item_genre.count
    else
      @items = Item.page(params[:page])
      @items_count = Item.count
    end
  end

end
