class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    @cart_item = CartItem.new
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    if @cart_item.count == nil
      redirect_back fallback_location: @cart_item.item
    else
    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|
      if cart_item.item_id == @cart_item.item_id
        new_count = cart_item.count + @cart_item.count
        cart_item.update_attribute(:count, new_count)
        @cart_item.delete
      end
    end
    @cart_item.save
    redirect_to public_cart_items_path
    end
  end


  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to public_cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to public_cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to public_cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :count)
  end

end
