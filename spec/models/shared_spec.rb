# == Schema Information
#
# Table name: shareds
#
#  id              :bigint           not null, primary key
#  user_id         :bigint           not null
#  sharedable_type :string           not null
#  sharedable_id   :bigint           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'rails_helper'

RSpec.describe Shared, type: :model do
  subject { build(:shared) }

  it { is_expected.to belong_to :sharedable }
end
