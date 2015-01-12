class AddProviderAndLocationToItems < ActiveRecord::Migration
  def change
    add_column :items, :provider, :string
    add_column :items, :location, :string
  end
end
