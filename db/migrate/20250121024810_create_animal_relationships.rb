class CreateAnimalRelationships < ActiveRecord::Migration[8.0]
  def change
    create_table :animal_relationships, id: false, comment: 'Possible relationship an animal can have with another animal.' do |t|
      t.integer :id, null: false, comment: 'Unique identifier for the relationship.', primary_key: true
      t.string :relationship, null: false, limit: 50, comment: 'Type of relationship.'

      t.timestamps
    end

    add_index :animal_relationships, :relationship, unique: true
  end
end
