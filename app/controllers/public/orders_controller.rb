class Public::OrdersController < ApplicationController

    def show
      @order = Order.find(params[:id])
      @order_item = @order.order_items
      @total = 0
    end

    def confirm
      @order = Order.new
      @cart_items = current_customer.cart_items
      @order.payment = params[:order][:payment]

    if params[:order][:address_option] == "0"
      @order.postal_code = current_customer.postal_code
      @order.order_address = current_customer.address

    elsif params[:order][:address_option] == "1"
      @sta = params[:order][:order_address].to_i
      binding.pry
      @order_address = Address.find(@sta)
      @order.postal_code = @order_address.postal_code
      @order.order_address = @order_address.adenddress
      @order.dear_name = @order_address.dear_name

    elsif params[:order][:address_option] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.order_address = params[:order][:order_address]
    end
    end
end
