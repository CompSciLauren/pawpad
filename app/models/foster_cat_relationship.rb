class FosterCatRelationship < ApplicationRecord
  validates :cat_id, presence: true
  validates :related_cat_id, presence: true
  validates :relationship_type, presence: true
end
