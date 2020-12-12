FactoryBot.define do
  factory :shared do
    user
    duedate { 7.days.from_now }
    professional { association :user }
  end
end
