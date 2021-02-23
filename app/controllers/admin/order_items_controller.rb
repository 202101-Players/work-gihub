class Admin::OrderItemsController < ApplicationController
  # 使用しない↓
  # def update
  #   @orderitem = OrderItem.find(params[:id])
  #   @orderitem.order_item.update(order_item_params)
  #   redirect_to  admin_orders_path, success: '登録に成功しました'
  # end
   
    def update
      @orderitem = OrderItem.find(params[:id])
      @orderitem.update(order_item_params)
      if @orderitem.making_status == 2
         @order.update(status: 2)
      elsif  @orderitem.making_status == 3
         @order.update(status: 3)
      end
      redirect_to  admin_orders_path, success: '登録に成功しました'
   
    end
   
   
    private

    def order_params
      params.require(:order).permit(:name, :postal_code, :address, :payment_method, :total_payment, :ship_cost, :status)
    end
  
    def order_item_params
      params.require(:order_item).permit(:making_status)
    end

  
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
