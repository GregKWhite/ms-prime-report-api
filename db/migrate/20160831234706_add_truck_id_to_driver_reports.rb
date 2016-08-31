class AddTruckIdToDriverReports < ActiveRecord::Migration[5.0]
  def change
    add_column :driver_reports, :truck_id, :integer, index: true
  end
end
