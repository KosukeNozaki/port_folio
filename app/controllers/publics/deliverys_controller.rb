class Publics::DeliverysController < ApplicationController
  # 配送先一覧・追加
  def index
    @deliverys = current_customer.address
    @delivery = Delivery.new
  end

  def edit
    @delivery = Delivery.find(params[:id])
  end

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.save
    redirect_to deliverys_path
  end

  def update
    @delivery = Delivey.find(params[:id])
    @delivery.update(delivery_params)
  end

  def destroy
    @delivery = Delivery.find(params[:id])
    @delivery.destroy
    redirect_to deliverys_path
  end
end
