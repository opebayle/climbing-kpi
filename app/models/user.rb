class User < ActiveRecord::Base
  has_many :checks
  has_many :routes, :through => :checks
end
