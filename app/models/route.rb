class Route < ActiveRecord::Base
  belongs_to :level
  belongs_to :grade
  has_many   :checks
  has_many   :users, :through => :checks
  before_save :default_values
  has_attached_file :image, styles: { large: "300x300>", medium: "200x200>", thumb: "50x50#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def default_values
    self.score ||= 10000
  end

  validates :level_id, presence: {
    message: "value missing !!"
  }

end
