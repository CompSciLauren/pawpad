class FosterCatHistory < ApplicationRecord
  validates :cat_id, presence: true
  validates :intake_date, presence: true
end
