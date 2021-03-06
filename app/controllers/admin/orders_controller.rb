class Admin::OrdersController < ApplicationController
  
  def index
    @orders = Order.all
    # @order = Order.find(params[:id])
  end
  
   def show
    # admin/orders/100
    # parameters: {"id" => "100"}
    @order = Order.find(params[:id])
    # @order_items = @order.order_items
   end
   
   def update
    @order = Order.find(params[:id])
    @order.update(status: order_params.to_i)
    
    if @order.status_before_type_cast == 1
      @order.order_items.update_all(making_status: 1)
    end
    redirect_to  admin_orders_path, success: '登録に成功しました'
   end

  
  private

  def order_params
    params[:order][:status]
  end

  def order_item_params
    params.require(:order_item).permit(:making_status)
  end

end