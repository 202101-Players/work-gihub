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
      @order.name = current_customer.last_name + current_customer.first_name

    elsif params[:order][:address_option] == "1"
      @order_address = current_customer.addresses.find(params[:order][:addresses])
      @order.postal_code = @order_address.postal_code
      @order.address = @order_address.address
      @order.name = @order_address.name

    elsif params[:order][:address_option] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end
    end

    def create
      @order = Order.new(order_params)
      @order.customer_id = current_customer.id
      #p @order
      @order.save
      @carts = current_customer.cart_items
      total_payment = 0
        @carts.each do |f|
          new_order_item = OrderItem.new
          new_order_item.order_id = @order.id
          new_order_item.item_id = f.item_id
          new_order_item.amount = f.count
          new_order_item.price = f.item.price*1.10
          total_payment += new_order_item.price * new_order_item.amount
          new_order_item.making_status = 0
          new_order_item.save
        end
      @order.ship_cost = 800
      total_payment += @order.ship_cost
      # @order.total_payment = total_payment
      @order.update_attributes(total_payment: total_payment)
      @carts.destroy_all
      redirect_to public_orders_thanks_path
    end

    def thanks

    end


    def index
      @orders = current_customer.orders
      p @orders
    end

    private

    def order_params
      params.require(:order).permit(:payment_method, :postal_code, :address, :ship_cost, :total_payment, :name)
    end

    def order_item_params
      params.require(:order_item).permit(:amount, :price )
    end

end
