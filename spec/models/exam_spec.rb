# create_table "exams", force: :cascade do |t|
#   t.string "title"
#   t.text "description"
#   t.date "exam_date"
#   t.string "place"
#   t.datetime "created_at", precision: 6, null: false
#   t.datetime "updated_at", precision: 6, null: false
# end
require 'rails_helper'

RSpec.describe Exam, type: :model do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:exam_date) }
  it { is_expected.to validate_presence_of(:place) }
end
