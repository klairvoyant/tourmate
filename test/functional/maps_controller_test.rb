require 'test_helper'

class MapsControllerTest < ActionController::TestCase
  fixtures :maps
  setup do
   # @map = maps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:maps)
    assert_template "index"
    assert_select "div#inital_map_head"
    assert_select "div#for_hide"
    assert_select "div#rightColumn"
    assert_select "div#for_hide" do
      assert_select "div#accordion" do
        assert_select "h3" do
          assert_select "a"
        end
        assert_select "div"
      end
    end
    assert_select("#for_hide #accordion h3 + div",:count=>7)
    maps=assigns(:maps)
    assert_equal 2, maps.size
  end
  
  test "should get new" do
   @request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64("root:cochin")
   get :new
   assert_response :success
   assert_template "new"
   assert_select "div.makeBig h2", :text=>"Enter Place Data"
   assert_select "div.field", :count=>5
   assert_select "div.actions", :count=>1
  end

end
