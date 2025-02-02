require "test_helper"

class FosterCatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @foster_cat = foster_cats(:one)
  end

  test "should destroy foster cat" do
    assert_difference("FosterCat.count", -1) do
      delete foster_cat_url(@foster_cat)
    end
    assert_redirected_to foster_cats_url
  end
end
