class CreateAnimalSexes < ActiveRecord::Migration[8.0]
  def change
    create_table :animal_sexes, id: false, comment: 'Reference table for storing the possible sexes of a cat' do |t|
      t.integer :id, null: false, comment: 'Unique identifier for the sex', primary_key: true
      t.char :sex, null: false, comment: 'Letter representation of the sex'
      t.string :sex_description, null: false, limit: 50, comment: 'Description of the sex'

      t.timestamps
    end

    add_index :animal_sexes, :sex, unique: true
  end
end
