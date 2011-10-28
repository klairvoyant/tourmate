require 'test_helper'

class DisplayTest < ActionDispatch::IntegrationTest
  fixtures :all

   test "display" do
    get "maps" 
    assert_response :success
    assert_template "index"
  end
end
