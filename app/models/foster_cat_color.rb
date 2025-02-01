class FosterCatColor < ApplicationRecord
  self.primary_key = [ :cat_id, :color_id ]

  belongs_to :foster_cat, foreign_key: :cat_id
  belongs_to :cat_color, foreign_key: :color_id

  validates :cat_id, presence: true
  validates :color_id, presence: true
end
