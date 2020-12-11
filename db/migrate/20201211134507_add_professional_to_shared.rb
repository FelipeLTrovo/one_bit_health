class AddProfessionalToShared < ActiveRecord::Migration[6.0]
  def change
    add_column :shareds, :professional_id, :integer
  end
end
