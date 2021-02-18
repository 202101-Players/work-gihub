class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def withdrow
    @customer =Customer.find(params[:id])
  end

end