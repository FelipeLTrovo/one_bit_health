# == Schema Information
#
# Table name: treatments
#
#  id          :bigint           not null, primary key
#  user_id     :bigint           not null
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

  it { is_expected.to belong_to(:user) } 
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:date) }
  it { is_expected.to validate_presence_of(:local) }
  it { is_expected.to validate_presence_of(:kind) }
  it { should define_enum_for(:kind).with([:medicamento, :cirurgia, :terapia, :alternativo]) }

  describe 'Creating treatment,' do
    subject { create(:treatment) }
    it { is_expected.to have_many(:tag_kinds) }
    it { is_expected.to have_many(:tags).through(:tag_kinds) }
  end
end
