class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.timestamps
      t.integer :customer_id
      t.integer :payment_method, default: 0
      t.string :post_number
      t.string :address
      t.string :name
      t.integer :postage
      t.integer :billing_amount
      t.integer :status, default: 0
    end
  end
end
