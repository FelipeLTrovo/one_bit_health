# == Schema Information
#
# Table name: tags
#
#  id           :bigint           not null, primary key
#  content      :string
#  tagable_type :string           not null
#  tagable_id   :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe 'Building tag,' do
    subject { build(:tag) }
    it { is_expected.to belong_to :tagable }
    it { is_expected.to validate_presence_of(:content) }
  end
end
