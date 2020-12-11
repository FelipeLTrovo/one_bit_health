# == Schema Information
#
# Table name: treatments
#
#  id           :bigint           not null, primary key
#  title        :string
#  description  :text
#  date         :datetime
#  local        :string
#  kind         :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  tagable_type :string
#  tagable_id   :bigint
#
require 'rails_helper'

RSpec.describe Treatment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
