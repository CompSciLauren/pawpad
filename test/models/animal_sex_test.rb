require "test_helper"

class AnimalSexTest < ActiveSupport::TestCase
  test "should not save an empty record" do
    animal_sex = AnimalSex.new
    assert_not animal_sex.save
  end
end
