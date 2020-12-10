# == Schema Information
#
# Table name: tags
#
#  id         :bigint           not null, primary key
#  content    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe 'Building tag,' do
    subject { build(:tag) }
    it { should validate_presence_of(:content) }
    it { should validate_uniqueness_of(:content) }
  end
end
