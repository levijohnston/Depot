class AddShippingToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :ship_class, :string, null: false, default: 'standard'
  end
end
