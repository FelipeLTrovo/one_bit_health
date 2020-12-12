# == Schema Information
#
# Table name: appointments
#
#  id           :bigint           not null, primary key
#  user_id      :bigint           not null
#  title        :string
#  description  :text
#  professional :string
#  date         :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  tagable_type :string           not null
#  tagable_id   :bigint           not null
#
require 'rails_helper'

RSpec.describe Appointment, type: :model do
  it { is_expected.to belong_to :user }
  it { is_expected.to validate_presence_of :user_id }
  it { is_expected.to validate_presence_of :date }
  it { is_expected.to validate_presence_of :professional }
end
