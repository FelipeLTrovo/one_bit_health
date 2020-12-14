class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.integer :role, default: 1
      t.string :name

      t.timestamps
    end
  end
end
