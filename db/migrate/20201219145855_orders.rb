class Orders < ActiveRecord::Migration[5.2]
  def change
  	add_column :orders, :credit_number, :string
  	add_column :orders, :card_name, :string
  	add_column :orders, :security_code, :integer
  end
end
