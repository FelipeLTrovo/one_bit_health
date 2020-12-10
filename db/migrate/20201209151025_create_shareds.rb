class CreateShareds < ActiveRecord::Migration[6.0]
  def change
    create_table :shareds do |t|
      t.user :references
      t.belongs_to :professional, references: :user

      t.references :sharedable, polymorphic: true, null: false  

      t.timestamps
    end
  end
end
