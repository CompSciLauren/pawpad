class FosterCat < ApplicationRecord
  validates :sex_id, presence: true
  validates :breed_id, presence: true
end
