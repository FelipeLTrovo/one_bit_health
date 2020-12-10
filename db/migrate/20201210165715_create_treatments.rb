class CreateTreatments < ActiveRecord::Migration[6.0]
  def change
    create_table :treatments do |t|
      t.string :title
      t.text :description
      t.datetime :date
      t.string :local
      t.integer :kind

      t.timestamps
    end
  end
end
