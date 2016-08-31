class CreateTrucks < ActiveRecord::Migration[5.0]
  def change
    create_table :trucks do |t|
      t.string :identifier, null: false, default: ''
      t.decimal :mileage, null: false, default: 0.0
      t.timestamps
    end
  end
end
