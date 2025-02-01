require "test_helper"

class CatBreedTest < ActiveSupport::TestCase
  test "should not save an empty record" do
    cat_breed = CatBreed.new
    assert_not cat_breed.save
  end
end
