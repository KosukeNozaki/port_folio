class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
	    t.integer :customer_id
	    t.integer :card_id
	    t.string :postal_code
	    t.string :email
	    t.string :address
	    t.string :telephone_number
	    t.integer :order_price
	    t.integer :payment_method, :default => 0
	    t.integer :status, :default => 0
	    t.integer :address_option, :default => 0
	    t.integer :postage
	    t.string :"name"
	    t.timestamps
    end
  end
end
