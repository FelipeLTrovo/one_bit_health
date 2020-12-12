class AddAppointmentToExams < ActiveRecord::Migration[6.0]
  def change
    add_reference :exams, :appointment, null: false, foreign_key: true
  end
end
