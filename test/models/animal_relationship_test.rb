require "test_helper"

class AnimalRelationshipTest < ActiveSupport::TestCase
  test "should not save an empty record" do
    animal_relationship = AnimalRelationship.new
    assert_not animal_relationship.save
  end
end
