# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  role                   :integer
#  name                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#
require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validations with "shoulda_matchers"' do
    describe 'Building user,' do
      subject { build(:user) }

      it { should validate_presence_of(:email) }
      it { should validate_presence_of(:role) }
      it { should validate_uniqueness_of(:email).case_insensitive }
    end
  end
end
