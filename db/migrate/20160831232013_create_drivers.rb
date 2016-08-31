class CreateDrivers < ActiveRecord::Migration[5.0]
  def change
    create_table :drivers do |t|
      t.string :name, null: false, default: ''
      t.string :password_digest, null: false, default: ''
      t.timestamps
    end
  end
end
