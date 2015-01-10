class AddPrimaryAndOrderToItems < ActiveRecord::Migration
  def change
    add_column :items, :primary, :boolean, default: false
    add_column :items, :order, :integer
  end
end
