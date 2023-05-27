class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.string :name, null: false
      t.string :post_code, null: false
      t.string :address, null: false
      t.integer :payment_method, null: false
      t.integer :total_amount, null: false
      t.integer :postage, null: false
      t.timestamps
    end
  end
end
