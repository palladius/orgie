require 'test_helper'

class GoliardsTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Goliards.new.valid?
  end
end
