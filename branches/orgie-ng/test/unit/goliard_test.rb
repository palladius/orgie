require 'test_helper'

class GoliardTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Goliard.new.valid?
  end
end
