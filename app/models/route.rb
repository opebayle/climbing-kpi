class Route < ActiveRecord::Base
  belongs_to :level
  belongs_to :grade
end
