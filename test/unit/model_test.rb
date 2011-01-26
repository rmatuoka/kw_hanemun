require 'test_helper'

class ModelTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Model.new.valid?
  end
end
