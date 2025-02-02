class CatColor < ApplicationRecord
  has_many :foster_cat_colors, foreign_key: :color_id

  validates :color, presence: true, uniqueness: true
end
