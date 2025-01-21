class AnimalRelationship < ApplicationRecord
  validates :relationship, presence: true, uniqueness: true
end
