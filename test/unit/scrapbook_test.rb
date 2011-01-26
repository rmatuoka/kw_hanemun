require 'test_helper'

class ScrapbookTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Scrapbook.new.valid?
  end
end
