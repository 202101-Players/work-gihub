class Admin::OrdersController < ApplicationController
  
  def index
    @orders = Order.all
  end
  
   def show
    # admin/orders/100
    # parameters: {"id" => "100"}
    @order = Order.find(params[:id])
    @order_items = @order.order_items
   end
  
  private

  def order_params
    params.require(:order).permit(:name, :postal_code, :address, :payment_method, :total_payment, :ship_cost, :status)
  end

  def order_item_arams
    params.require(:order_item).permit(:making_status)
  end

end