class AddUserToPatient < ActiveRecord::Migration[8.1]
  def change
    change_table :patients do |t|
      t.references :user, null: true, foreign_key: true
    end
  end
end
