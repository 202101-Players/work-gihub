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

   def  update
     @order = Order.find(params[:id])
     @order.update(order_params)
     @order_items = @order.order_items
    if @order.status == 0
       @order_items.update_all(making_status: 1)
    end
      redirect_to admin_order_path(@order)

   end

  private

  def order_params
    params.require(:order).permit(:name, :postal_code, :address, :payment_method, :total_payment, :ship_cost, :status)
  end

  def order_item_params
    params.require(:order_item).permit(:making_status)
  end

end
