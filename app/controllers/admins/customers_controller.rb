class Admins::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end
  # 顧客一覧画面

  def show
    @customer = Customer.find(params[:id])
  end
  # 顧客詳細画面

  def edit
    @customer = Customer.find(params[:id])

  end
  # 顧客編集画面

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
  end
  # 顧客情報の更新
  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :postal_code, :address, :telephone_number, :is_active )
  end
end
