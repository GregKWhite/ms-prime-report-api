class CreateWeeklyReports < ActiveRecord::Migration[5.0]
  def change
    create_table :weekly_reports do |t|
      t.belongs_to :truck
      t.decimal :initial_mileage, default: 0.0, null: false
      t.decimal :current_mileage, default: 0.0, null: false
      t.decimal :total_gas, default: 0.0, null: false
      t.decimal :total_paid, default: 0.0, null: false
      t.timestamps
    end
  end
end
