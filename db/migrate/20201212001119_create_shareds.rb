class CreateShareds < ActiveRecord::Migration[6.0]
  def change
    create_table :shareds do |t|
      t.references :user, null: false, foreign_key: true
      t.date :duedate
      t.belongs_to :professional, :integer, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
