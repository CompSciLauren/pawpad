class CreateFosterCatColors < ActiveRecord::Migration[8.0]
  def change
    create_table :foster_cat_colors, id: false, comment: 'Color(s) that each cat has.' do |t|
      t.integer :cat_id, null: false, comment: 'Unique identifier for the cat. FK to foster_cats.'
      t.integer :color_id, null: false, comment: 'ID of the color of the cat. FK to cat_colors.'

      t.timestamps
    end

    # Add composite primary key
    add_index :foster_cat_colors, [ :cat_id, :color_id ], unique: true, name: 'index_foster_cat_colors_on_composite_key'
    execute 'ALTER TABLE foster_cat_colors ADD PRIMARY KEY (cat_id, color_id);'
  end
end
