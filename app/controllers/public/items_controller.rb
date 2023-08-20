class Public::ItemsController < ApplicationController
  def show
  end

  def index
    @items=Item.all
    @genres = Genre.all
    
  end
end
