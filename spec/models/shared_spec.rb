# == Schema Information
#
# Table name: shareds
#
#  id              :bigint           not null, primary key
#  duedate         :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  integer_id      :bigint
#  professional_id :bigint
#  user_id         :bigint           not null
#
# Indexes
#
#  index_shareds_on_integer_id       (integer_id)
#  index_shareds_on_professional_id  (professional_id)
#  index_shareds_on_user_id          (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (integer_id => users.id)
#  fk_rails_...  (professional_id => users.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Shared, type: :model do
  before(:each) do
    @shared = create(:shared)
  end

  subject { @shared }

  it { is_expected.to belong_to :user }
  it { is_expected.to belong_to :professional }
  it { is_expected.to validate_presence_of :user_id }
  it { is_expected.to validate_presence_of :duedate }
  it { is_expected.to validate_presence_of :professional_id }
  it { is_expected.to validate_uniqueness_of(:user_id).scoped_to(:professional_id, :duedate) }

  it "can't have past due_date" do
    subject.duedate = 1.day.ago
    subject.valid?
    expect(subject.errors.keys).to include :duedate
  end

  it "is valid with future date" do
    subject.duedate = Date.current + 7.days
    subject.valid?
    expect(subject.errors.keys).to_not include :duedate
  end
end
