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
FactoryBot.define do
  factory :shared do

    # after :build do |shared|
    #   shared.sharedable = create(:exam, :appointment, :tratament)
    # end
    user
    professional_id factory: :user
    sharedable_id {rand(1..999)} 
    sharedable_type {%w[Exam Appoinment Treatment].sample}
  end
end
