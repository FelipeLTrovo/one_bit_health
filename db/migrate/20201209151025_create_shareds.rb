class CreateShareds < ActiveRecord::Migration[6.0]
  def change
    create_table :shareds do |t|
      t.references :user, null: false, foreign_key: true
      t.belongs_to :professional, references: :user, foreign_key:  {to_table: :users }

      t.references :sharedable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
