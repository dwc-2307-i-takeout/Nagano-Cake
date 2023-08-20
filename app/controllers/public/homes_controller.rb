class Public::HomesController < ApplicationController
  def top
    @Item = Item.all.last(4)
    @items = Item.all
  end

  def about
  end
end
