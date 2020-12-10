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
FactoryBot.define do
  factory :tag do
    sequence(:content) {|n| "Tag - #{n}"}

    after :build do |tag|
      # tag.productable = create()
    end
  end
end
