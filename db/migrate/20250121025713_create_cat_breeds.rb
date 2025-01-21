class CreateCatBreeds < ActiveRecord::Migration[8.0]
  def change
    create_table :cat_breeds, id: false, comment: 'Reference table for storing the possible breeds of a cat' do |t|
      t.integer :id, null: false, comment: 'Unique identifier for the breed', primary_key: true
      t.string :breed, null: false, limit: 50, comment: 'Breed of the cat'

      t.timestamps
    end

    add_index :cat_breeds, :breed, unique: true
  end
end
