class CreatePatients < ActiveRecord::Migration[8.1]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :email
      t.string :responsible
      t.string :phone
      t.string :responsible_phone
      t.string :address
      t.string :emergency_type

      t.timestamps
    end
  end
end
