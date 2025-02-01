require "test_helper"

class FosterCatRelationshipTest < ActiveSupport::TestCase
  test "should not save an empty record" do
    foster_cat_relationship = FosterCatRelationship.new
    assert_not foster_cat_relationship.save
  end
end
