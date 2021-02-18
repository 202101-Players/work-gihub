class Admin::ItemsController < ApplicationController
  def new
  end

  def create
  end

  def index
     @items = Item.all
     
  end

  def show
    @item =  Item.find(params[:id])
  end
  
  private

  def item_params
    params.require(:item).permit(:name, :image, :introduction, :price)
  end
  
end

