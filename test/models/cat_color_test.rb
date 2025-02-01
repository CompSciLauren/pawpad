require "test_helper"

class CatColorTest < ActiveSupport::TestCase
  test "should not save an empty record" do
    cat_color = CatColor.new
    assert_not cat_color.save
  end
end
