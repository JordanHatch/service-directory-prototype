class AddOverviewToServices < ActiveRecord::Migration
  def change
    add_column :services, :overview, :text
  end
end
