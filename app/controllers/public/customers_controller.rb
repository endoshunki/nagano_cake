class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customers = Customer.find(current_customer.id)
    #同じアクション内で同じ変数を使うことは、上書きしてもいいときのみ
  end

  def edit
    @customers = Customer.find(current_customer.id)
    #同じインスタンス変数で上書きしてしまった
  end

  def update
    @customers.update(customer_params)
    redirect_to customers_mypage_path
  end

  def withdrawal_confirm
  end

  def withdrawal
    @customers = Customer.find(current_customer.id)
    @customers.update(is_deleted: true)
    reset_session
    redirect_to root_path  
  end

 private 
 
 def customer_params
   params.require(:customer).permit(:last_name, :last_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
 end
 
end
