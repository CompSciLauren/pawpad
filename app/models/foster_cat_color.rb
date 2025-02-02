class FosterCatColor < ApplicationRecord
  self.primary_key = [ :cat_id, :color_id ]

  belongs_to :cat_color, foreign_key: :color_id

  validates :color_id, presence: true
end
