class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :postal_code
      t.string :address
      t.string :name
      t.integer :payment_method
      t.integer :status
      t.integer :ship_cost
      t.integer :total_payment
      t.timestamps
    end
  end
end
