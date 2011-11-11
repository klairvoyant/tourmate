class Map < ActiveRecord::Base
 validates(:name,:catagory,:lng,:lat, :presence => true)
 validates(:lng,:lat, :length => { :in => 6..8 })
 validates :name, :uniqueness => true
 validates :lng,:lat, :numericality => true
end
