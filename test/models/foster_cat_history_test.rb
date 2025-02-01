require "test_helper"

class FosterCatHistoryTest < ActiveSupport::TestCase
  test "should not save an empty record" do
    foster_cat_history = FosterCatHistory.new
    assert_not foster_cat_history.save
  end
end
