FactoryBot.define do
  factory :shared do
    after :build do |shared|
      shared.sharedable = create(:exam, :appointment, :tratament)
    end
    references ""
    sharedable nil
  end
end
