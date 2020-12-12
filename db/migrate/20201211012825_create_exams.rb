class CreateExams < ActiveRecord::Migration[6.0]
  def change
    create_table :exams do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.date :exam_date
      t.string :place

      t.timestamps
    end
  end
end
