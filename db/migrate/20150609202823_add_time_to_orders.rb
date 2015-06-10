class AddTimeToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :placed_at, :datetime, default: Time.now

  end
end
