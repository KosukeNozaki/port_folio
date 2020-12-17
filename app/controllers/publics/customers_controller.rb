class Publics::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end
  # 顧客のマイページ

  def edit
    @customer = Customer.find(params[:id])
  end
  # 顧客の登録情報編集画面
  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customer_path(@customer)
  end
  # 顧客の登録情報更新

  def index

  end
  # 顧客の退会確認画面

  def status
    @customer = current_customer
    @customer.update(is_active: false)
    sign_out
    redirect_to root_path
  end
  # 顧客の退会処理（ステータスの更新）
  private
  def customer_params
     params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :postal_code, :address, :telephone_number, :is_active)
  end
end
