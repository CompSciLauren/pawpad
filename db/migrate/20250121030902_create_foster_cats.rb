class CreateFosterCats < ActiveRecord::Migration[8.0]
  def change
    create_table :foster_cats, comment: 'Basic information about each foster cat.' do |t|
      t.string :name, null: false, limit: 50, comment: 'Name of the cat.'
      t.integer :sex_id, null: false, comment: 'Sex of the cat. FK to animal_sexes.'
      t.integer :breed_id, null: false, comment: 'Breed of the cat. FK to cat_breeds.'
      t.date :birth_date, comment: 'Date of birth of the cat. NULL if not yet known.'

      t.timestamps
    end
  end
end
