class Public::CartItemsController < ApplicationController

  def index
    @cart_item = CartItem.new
    @cart_items = current_customer.cart_items
  end

  def create
    @cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    if @cart_item.blank?
      #カートの中身が空の場合
      @cart_item = current_customer.cart_items.build(item_id: params[:cart_item][:item_id], quantity: params[:cart_item][:quantity])
    else
      #カートに中身がある場合
      @cart_item.quantity = @cart_item.quantity + params[:cart_item][:quantity]
    end

    if @cart_item.save
      redirect_to public_cart_items_path, noteice: "商品が追加されました！"
    else
      @item = Item.find_by(id: params[:cart_item][:item_id])
      redirect_to public_item_path(@item), notice: "商品の追加に失敗しました..."
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    if @cart_item.destroy
      redirect_to request.referer, notice: "対象品を削除しました！"
    else
      redirect_to request.referer, notice: "対象品の削除に失敗しました..."
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to request.referer, notice: "商品の個数を変更しました！"
    else
      render "index"
    end
  end

  def destroy_all
    if current_customer.cart_items.destroy_all
      redirect_to request.referer, notice: "カート内の全商品を削除しました！"
    else
      render "index"
    end
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :quantity)
  end

end
