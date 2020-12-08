class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.integer :role
      t.string :name

      t.timestamps
    end
  end
end
