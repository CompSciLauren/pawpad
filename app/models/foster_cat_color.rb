class FosterCatColor < ApplicationRecord
  validates :cat_id, presence: true
  validates :color_id, presence: true
end
