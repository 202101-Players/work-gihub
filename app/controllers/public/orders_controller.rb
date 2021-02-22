class Public::OrdersController < ApplicationController

    def new
      @customer = current_customer
      @all = current_customer.cart_items
      # @all = Item.all
      # # @i.each do |cart_item|
      #   @all = @all.where.not(id: cart_item.item.item_id)
      # end
      # @item_random = @all.order("RANDOM()").limit(2)

      @order = Order.new
      @address = Address.new
      @addresses = Address.all
    end

    def confirm
      @order = Order.new(order_params)
      @cart_items = current_customer.cart_items

    if params[:order][:address_option] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address

    elsif params[:order][:address_option] == "1"
      @sta = params[:order][:order_address]
      @order.postal_code = @order_address.postal_code
      @order.address = @order_address.adenddress
      @order.dear_name = @order_address.dear_name

    elsif params[:order][:address_option] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:order_address]
    end
    end

    def create
      @order = Order.new(order_params)
      @order.save
      redirect_to public_orders_thanks_path
    end

    def thanks

    end
    



    private

    def order_params
      params.require(:order).permit(:payment_method, :postal_code, :address, :ship_cost, :total_payment )
    end

    def order_item_params
      params.require(:order_item).permit(:amount, :price, )
    end

end
