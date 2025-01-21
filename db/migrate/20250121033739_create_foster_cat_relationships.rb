class CreateFosterCatRelationships < ActiveRecord::Migration[8.0]
  def change
    create_table :foster_cat_relationships, comment: 'The relationship a cat has with other cats.' do |t|
      t.integer :cat_id, null: false, comment: 'ID of the cat. FK to foster_cats.'
      t.integer :related_cat_id, null: false, comment: 'ID of the related cat. FK to foster_cats.'
      t.integer :relationship_type, null: false, comment: 'ID of the relationship. FK to animal_relationships.'

      t.timestamps
    end
  end
end
