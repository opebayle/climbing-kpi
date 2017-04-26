class Route < ActiveRecord::Base
  belongs_to :level
  belongs_to :grade
  has_many   :checks
  has_many   :users, :through => :checks
end
