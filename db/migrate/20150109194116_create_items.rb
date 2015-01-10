class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :group, null: false
      t.integer :service_id, null: false
      t.timestamps
    end
  end
end
