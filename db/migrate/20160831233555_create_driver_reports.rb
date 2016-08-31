class CreateDriverReports < ActiveRecord::Migration[5.0]
  def change
    create_table :driver_reports do |t|
      t.belongs_to :driver
      t.belongs_to :location
      t.belongs_to :helper
      t.decimal :gallons, null: false, default: 0.0
      t.decimal :amount_paid, null: false, default: 0.0
      t.decimal :mileage, null: false, default: 0.0
      t.text :notes, null: false, default: ''

      t.timestamps
    end
  end
end
