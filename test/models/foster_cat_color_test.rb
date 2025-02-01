require "test_helper"

class FosterCatColorTest < ActiveSupport::TestCase
  test "should not save an empty record" do
    foster_cat_color = FosterCatColor.new
    assert_not foster_cat_color.save
  end
end
