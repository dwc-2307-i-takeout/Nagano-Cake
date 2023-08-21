class Public::ItemsController < ApplicationController
  def show
  end

  def index
    @genres = Genre.all
    if params[:genre]
      genre=Genre.find_by(name: params[:genre])
      @items=genre.items
    else
      @items = Item.all
    end
  end
end
