class Shared < ApplicationRecord
  belongs_to :sharedable, polymorphic: true
end
