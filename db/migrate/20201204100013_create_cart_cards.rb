class CreateCartCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_cards do |t|
    	t.integer :card_id
    	t.integer :customer_id
    	t.integer :amount
    	t.timestamps
    end
  end
end
