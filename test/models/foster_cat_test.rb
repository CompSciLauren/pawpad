require "test_helper"

class FosterCatTest < ActiveSupport::TestCase
  test "should not save an empty record" do
    foster_cat = FosterCat.new
    assert_not foster_cat.save
  end

  test "should save a record when provided valid set of params" do
    foster_cat = FosterCat.new(
      {
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
end
