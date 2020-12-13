# == Schema Information
#
# Table name: exams
#
#  id           :bigint           not null, primary key
#  user_id      :bigint           not null
#  title        :string
#  description  :text
#  exam_date    :date
#  place        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  tagable_type :string           not null
#  tagable_id   :bigint           not null
#
require 'rails_helper'

RSpec.describe Exam, type: :model do
  it { is_expected.to belong_to :user }
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:exam_date) }
  it { is_expected.to validate_presence_of(:place) }
end
