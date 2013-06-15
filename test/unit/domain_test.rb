require 'test_helper'
require 'resolv'

class DomainTest < ActiveSupport::TestCase
  test "get_current_ip" do
    domain = Domain.find(1)
    current_ip = domain.get_current_ip
    assert(is_ipaddress_format(current_ip))
    # assert(Resolv::IPv4::Regex =~ current_ip)
    # assert_equal "61.21.65.202", domain.update_ip
  end

  test "get_previous_ip" do
    @domain = Domain.order('updated_at desc').limit(1)
    assert_equal 1, @domain.size
    assert_equal "192.168.215.1", @domain[0].previous_ip
  end

end
