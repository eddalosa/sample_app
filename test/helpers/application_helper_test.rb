require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
	test "full title helper" do 
		assert_equal full_title,		 "PEFA Church Kayole B"
		assert_equal full_title("Help"), "Help | PEFA Church Kayole B"
	end
end