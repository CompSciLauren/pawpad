class FosterCat < ApplicationRecord
  has_many :foster_cat_colors, foreign_key: :cat_id
  has_many :cat_colors, through: :foster_cat_colors

  accepts_nested_attributes_for :foster_cat_colors

  validates :set_id, presence: { message: "Enter a set number" },
                    numericality: { only_integer: true, greater_than: 0, message: "Must be a positive number" }
  validates :name, presence: { message: "Error: Add a name. Hint: You can use a placeholder like \"Kitten 1\" and update it later." }
  validates :sex_id, presence: { message: "Error: Select a sex." }
  validates :breed_id, presence: { message: "Error: Select a breed." }
  validates :foster_cat_colors, presence: { message: "Error: Select at least one color." }
end
