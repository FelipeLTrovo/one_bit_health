class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.string :content
      t.references :tagable, polymorphic: true, null: false
      
      t.timestamps
    end
  end
end
