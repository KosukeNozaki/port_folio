class Publics::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end
  # 顧客のマイページ

  def edit
    @customer = Customer(params[:id])
  end
  # 顧客の登録情報編集画面
  def update
    @customer = Customer(params[:id])
    @customer.update(customer_params)
  end
  # 顧客の登録情報更新

  def index
  end
  # 顧客の退会確認画面

  def status
  end
  # 顧客の退会処理（ステータスの更新）
  private
  def customer_params
     params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :postal_code, :address, :telephone_number, :is_active)
  end
end
