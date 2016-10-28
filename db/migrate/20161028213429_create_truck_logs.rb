class CreateTruckLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :truck_logs do |t|
      t.belongs_to :truck
      t.decimal :price
      t.decimal :mileage
      t.text :description
      t.date :performed_on
    end
  end
end
