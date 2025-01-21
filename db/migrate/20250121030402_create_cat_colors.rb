class CreateCatColors < ActiveRecord::Migration[8.0]
  def change
    create_table :cat_colors, id: false, comment: 'Reference table for storing the possible colors of a cat' do |t|
      t.integer :id, null: false, comment: 'Unique identifier for the color', primary_key: true
      t.string :color, null: false, limit: 50, comment: 'Color of the cat'

      t.timestamps
    end

    add_index :cat_colors, :color, unique: true
  end
end
