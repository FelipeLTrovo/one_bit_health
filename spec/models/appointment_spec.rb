# == Schema Information
#
# Table name: appointments
#
#  id           :bigint           not null, primary key
#  date         :datetime
#  description  :text
#  professional :string
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_appointments_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Appointment, type: :model do
  it { is_expected.to belong_to :user }
  it { is_expected.to validate_presence_of :user_id }
  it { is_expected.to validate_presence_of :date }
  it { is_expected.to validate_presence_of :professional }
end
