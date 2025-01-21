class AnimalSex < ApplicationRecord
  validates :sex, presence: true, uniqueness: true
  validates :sex_description, presence: true
end
