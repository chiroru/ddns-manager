require 'test_helper'

class DomainTest < ActiveSupport::TestCase
  test "get_ip" do
    d = Domain.find(1)
    assert_equal "61.21.65.202", d.update_ip
  end

  test "search_previous_ip" do
    previous_updated_at = Domain.maximum(:updated_at)
    d = Domain.order('updated_at').limit(1)
    assert_equal "192.168.215.3", d.previous_ip
  end

end
