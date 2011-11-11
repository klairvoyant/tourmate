require 'test_helper'

class MapTest < ActiveSupport::TestCase
  fixtures :maps
  test "data_validiaty_name" do
    #checking blank name
    u=Map.new
    u.name=""
    u.lat="13.21682"
    u.lng="75.99149"
    u.catagory="forest"
    assert !u.save
    
    #checking duplicate name
    u.name="halebidue"
    u.lat="13.21682"
    u.lng="75.99149"
    u.catagory="historic"
    assert !u.save
    
  end
   test "data_validiaty_lng" do
    u=Map.new 
    #checking numerical value
    u.name="halebidue"
    u.lat="13.21682"
    u.lng="hello"
    u.catagory="historic"
    assert !u.save
    
    #checking blank value
    u.name="halebidue"
    u.lat="13.21682"
    u.lng=""
    u.catagory="historic"
    assert !u.save
    
    #checking short value
    u.name="halebidue"
    u.lat="13.21682"
    u.lng="75.9"
    u.catagory="historic"
    assert !u.save
    
    #checking long value
    u.name="halebidue"
    u.lat="13.21682"
    u.lng="75.9914955"
    u.catagory="historic"
    assert !u.save
    
     
   end
    test "data_validiaty_lat" do
    u=Map.new 
    #checking numerical value
    u.name="halebidue"
    u.lat="hello"
    u.lng="75.99149"
    u.catagory="historic"
    assert !u.save
    
    #checking blank value
    u.name="halebidue"
    u.lat=""
    u.lng="75.99149"
    u.catagory="historic"
    assert !u.save
    
    #checking short value
    u.name="halebidue"
    u.lat="13.2"
    u.lng="75.99149"
    u.catagory="historic"
    assert !u.save
    
    #checking long value
    u.name="halebidue"
    u.lat="13.2168233"
    u.lng="75.99149"
    u.catagory="historic"
    assert !u.save
      
    end
    test "data_correct" do
    u=Map.new 
    #checking with correct value
    u.name="halebidue2"
    u.lat="13.21682"
    u.lng="75.99149"
    u.catagory="historic"
    assert u.save
    end
end
