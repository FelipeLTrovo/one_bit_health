class CreateShareds < ActiveRecord::Migration[6.0]
  def change
    create_table :shareds do |t|
      t.references :user, null: false, foreign_key: true

      t.date :duedate

      t.timestamps
    end
  end
end
