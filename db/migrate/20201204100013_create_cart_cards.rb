class CreateCartCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_cards do |t|

      t.timestamps
    end
  end
end
