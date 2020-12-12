FactoryBot.define do
  factory :exam do
    sequence(:title) { |n| "Exame #{n}" }  
    description "Ultrasom de abdomen total"
    exam_date { Time.now }
    place "MyString"
    appointment
  end
end
