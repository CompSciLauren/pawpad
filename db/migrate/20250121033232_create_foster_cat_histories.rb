class CreateFosterCatHistories < ActiveRecord::Migration[8.0]
  def change
    create_table :foster_cat_histories, comment: 'Basic information about the history of each cat.' do |t|
      t.integer :cat_id, null: false, comment: 'ID of the cat. FK to foster_cats.'
      t.date :intake_date, null: false, comment: 'Date the cat entered the foster home.'
      t.date :adoption_date, comment: 'Date the cat was adopted.'
      t.string :adopter_description, comment: 'Any notes about the adopter/family that adopted the cat.'
      t.string :return_description, comment: 'If cat was returned, any notes about the situation.'

      t.timestamps
    end
  end
end
