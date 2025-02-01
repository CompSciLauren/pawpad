class FosterCat < ApplicationRecord
  has_many :foster_cat_colors, foreign_key: :cat_id
  has_many :cat_colors, through: :foster_cat_colors

  validates :name, presence: true
  validates :sex_id, presence: true
  validates :breed_id, presence: true
end
