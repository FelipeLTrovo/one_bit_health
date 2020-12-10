# == Schema Information
#
# Table name: tags
#
#  id         :bigint           not null, primary key
#  content    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :tag do
    sequence(:content) {|n| "Tag - #{n}"}
  end
end
