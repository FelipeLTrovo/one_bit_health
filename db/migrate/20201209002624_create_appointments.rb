class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.string :professional
      t.datetime :date

      t.timestamps
    end
  end
end
