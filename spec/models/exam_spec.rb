# == Schema Information
#
# Table name: exams
#
#  id          :bigint           not null, primary key
#  description :text
#  exam_date   :date
#  place       :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_exams_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Exam, type: :model do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:exam_date) }
  it { is_expected.to validate_presence_of(:place) }
end
