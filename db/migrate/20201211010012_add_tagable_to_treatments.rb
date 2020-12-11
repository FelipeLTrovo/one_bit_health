class AddTagableToTreatments < ActiveRecord::Migration[6.0]
  def change
    add_reference :treatments, :tagable, polymorphic: true
  end
end
