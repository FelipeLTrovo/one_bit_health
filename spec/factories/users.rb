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
FactoryBot.define do
  factory :user do
    role User::ROLES.keys.sample
    sequence(:name) {|n| "User - #{n}"}
  end
end
