require "test_helper"

class FosterCatTest < ActiveSupport::TestCase
  test "should not save an empty record" do
    foster_cat = FosterCat.new
    assert_not foster_cat.save
  end

  test "should save a record when provided valid set of params" do
    foster_cat = FosterCat.new(
      {
        "set_id": 1,
        "name": "Tucker",
        "sex_id": 1,
        "breed_id": 1,
        "birth_date": "2021-04-01",
        "foster_cat_colors_attributes": [
          { "color_id": 1 } # Make sure you have a valid color_id in your database
        ]
      }
    )

    assert foster_cat.save
  end

  test "should not save without set_id" do
    foster_cat = FosterCat.new(
      {
        "name": "Tucker",
        "sex_id": 1,
        "breed_id": 1,
        "birth_date": "2021-04-01",
        "foster_cat_colors_attributes": [
          { "color_id": 1 }
        ]
      }
    )

    assert_not foster_cat.save
    assert_includes foster_cat.errors[:set_id], "Error: Enter a set number."
  end

  test "should not save with negative set_id" do
    foster_cat = FosterCat.new(
      {
        "set_id": -1,
        "name": "Tucker",
        "sex_id": 1,
        "breed_id": 1,
        "birth_date": "2021-04-01",
        "foster_cat_colors_attributes": [
          { "color_id": 1 }
        ]
      }
    )

    assert_not foster_cat.save
    assert_includes foster_cat.errors[:set_id], "Error: Set number must be a positive integer."
  end

  test "should not save with zero set_id" do
    foster_cat = FosterCat.new(
      {
        "set_id": 0,
        "name": "Tucker",
        "sex_id": 1,
        "breed_id": 1,
        "birth_date": "2021-04-01",
        "foster_cat_colors_attributes": [
          { "color_id": 1 }
        ]
      }
    )

    assert_not foster_cat.save
    assert_includes foster_cat.errors[:set_id], "Error: Set number must be a positive integer."
  end

  test "should not save with non-integer set_id" do
    foster_cat = FosterCat.new(
      {
        "set_id": 1.5,
        "name": "Tucker",
        "sex_id": 1,
        "breed_id": 1,
        "birth_date": "2021-04-01",
        "foster_cat_colors_attributes": [
          { "color_id": 1 }
        ]
      }
    )

    assert_not foster_cat.save
    assert_includes foster_cat.errors[:set_id], "Error: Set number must be a positive integer."
  end
end
