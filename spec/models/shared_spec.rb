require 'rails_helper'

RSpec.describe Shared, type: :model do
  subject { build(:shared) }

  it { is_expected.to belong_to :sharedable }
end
