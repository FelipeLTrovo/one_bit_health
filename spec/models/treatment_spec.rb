# == Schema Information
#
# Table name: treatments
#
#  id          :bigint           not null, primary key
#  title       :string
#  description :text
#  date        :datetime
#  local       :string
#  kind        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Treatment, type: :model do
  describe 'Building treatment,' do
    subject { build(:treatment) }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:date) }
    it { is_expected.to validate_presence_of(:local) }
    it { is_expected.to validate_presence_of(:kind) }
  end

  describe 'Creating treatment,' do
    subject { create(:treatment) }
    it { is_expected.to have_many(:tags) }
  end
end
