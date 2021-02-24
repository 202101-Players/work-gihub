class Public::ItemsController < ApplicationController
  def index
    @genre = Genre.all
    @items = Item.all.page(params[:page]).per(8)
  end

  def show
    @item =  Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def item_params
    params.require(:item).permit(:genre, :image_id, :name, :intr, :price, :is_active)
  end
end
