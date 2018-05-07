class Route < ActiveRecord::Base
  belongs_to :level
  belongs_to :grade
  has_many   :checks
  has_many   :users, :through => :checks
  before_save :default_values

  def default_values
    self.score ||= 10000
  end

  validates :level_id, presence: {
    message: "value missing !!"
  }

end
