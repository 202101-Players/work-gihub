class Admin::OrderItemsController < ApplicationController
  # 使用しない↓

  # def index
  #   @order_items = Order_items.all
  # end

  # def show
  #   @order = OrderItems.find(params[:id])
  # end

  # private

  # def order_params
  #   params.require(:order).permit(:name, :postal_code, :address, :payment_method, :total_payment, :ship_cost, :status)
  # end

end
