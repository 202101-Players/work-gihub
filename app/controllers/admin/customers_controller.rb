class Admin::CustomersController < ApplicationController
  def new
  end

  def create
  end

  def index
     @customers = Customer.all
  end

  def show
  end

  def destroy
  end
  
end
