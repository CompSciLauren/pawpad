# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_01_21_033744) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "animal_relationships", id: { type: :serial, comment: "Unique identifier for the relationship." }, comment: "Possible relationship an animal can have with another animal.", force: :cascade do |t|
    t.string "relationship", limit: 50, null: false, comment: "Type of relationship."
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["relationship"], name: "index_animal_relationships_on_relationship", unique: true
  end

  create_table "animal_sexes", force: :cascade do |t|
    t.string "sex"
    t.string "sex_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cat_breeds", id: { type: :serial, comment: "Unique identifier for the breed" }, comment: "Reference table for storing the possible breeds of a cat", force: :cascade do |t|
    t.string "breed", limit: 50, null: false, comment: "Breed of the cat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["breed"], name: "index_cat_breeds_on_breed", unique: true
  end

  create_table "cat_colors", id: { type: :serial, comment: "Unique identifier for the color" }, comment: "Reference table for storing the possible colors of a cat", force: :cascade do |t|
    t.string "color", limit: 50, null: false, comment: "Color of the cat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["color"], name: "index_cat_colors_on_color", unique: true
  end

  create_table "foster_cat_colors", primary_key: ["cat_id", "color_id"], comment: "Color(s) that each cat has.", force: :cascade do |t|
    t.integer "cat_id", null: false, comment: "Unique identifier for the cat. FK to foster_cats."
    t.integer "color_id", null: false, comment: "ID of the color of the cat. FK to cat_colors."
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cat_id", "color_id"], name: "index_foster_cat_colors_on_composite_key", unique: true
  end

  create_table "foster_cat_histories", comment: "Basic information about the history of each cat.", force: :cascade do |t|
    t.integer "cat_id", null: false, comment: "ID of the cat. FK to foster_cats."
    t.date "intake_date", null: false, comment: "Date the cat entered the foster home."
    t.date "adoption_date", comment: "Date the cat was adopted."
    t.string "adopter_description", comment: "Any notes about the adopter/family that adopted the cat."
    t.string "return_description", comment: "If cat was returned, any notes about the situation."
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "foster_cat_relationships", comment: "The relationship a cat has with other cats.", force: :cascade do |t|
    t.integer "cat_id", null: false, comment: "ID of the cat. FK to foster_cats."
    t.integer "related_cat_id", null: false, comment: "ID of the related cat. FK to foster_cats."
    t.integer "relationship_type", null: false, comment: "ID of the relationship. FK to animal_relationships."
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "foster_cats", comment: "Basic information about each foster cat.", force: :cascade do |t|
    t.string "name", limit: 50, comment: "Name of the cat."
    t.integer "sex_id", null: false, comment: "Sex of the cat. FK to animal_sexes."
    t.integer "breed_id", null: false, comment: "Breed of the cat. FK to cat_breeds."
    t.date "birth_date", comment: "Date of birth of the cat. NULL if not yet known."
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
