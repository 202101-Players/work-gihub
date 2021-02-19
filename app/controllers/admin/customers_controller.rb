class Admin::CustomersController < ApplicationController
  
  def index
     @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
     @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to  admin_customer_path, success: '登録に成功しました'
  end

 private

  def genre_params
    params.require(:customer).permit(:email, :last_name, :first_mame, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_deleted)
  end
end
