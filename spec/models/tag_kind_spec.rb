# == Schema Information
#
# Table name: tag_kinds
#
#  id           :bigint           not null, primary key
#  tag_id       :bigint           not null
#  tagable_type :string           not null
#  tagable_id   :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'rails_helper'

RSpec.describe TagKind, type: :model do
  describe 'Building tag,' do
    subject { build(:tag_kind) }
    it { is_expected.to belong_to :tagable }
    it { is_expected.to belong_to :tag }
  end
end
