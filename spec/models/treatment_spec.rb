# == Schema Information
#
# Table name: treatments
#
#  id          :bigint           not null, primary key
#  date        :datetime
#  description :text
#  kind        :integer
#  local       :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_treatments_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Treatment, type: :model do

  it { is_expected.to belong_to(:user) } 
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:date) }
  it { is_expected.to validate_presence_of(:local) }
  it { is_expected.to validate_presence_of(:kind) }

  describe 'Creating treatment,' do
    subject { create(:treatment) }
    it { is_expected.to have_many(:tag_kinds) }
    it { is_expected.to have_many(:tags).through(:tag_kinds) }
  end
end
