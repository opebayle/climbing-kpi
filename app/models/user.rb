class User < ActiveRecord::Base
  has_many :checks
  has_many :routes, :through => :checks
  before_save :default_values

  def default_values
    self.role ||= "climber"
  end

  validates :login, uniqueness: {
    message: "already used !!"
  }


  validates :login, presence: {
    message: "value missing !!"
  }

  validates :email, presence: {
    message: "value missing !!"
  }

  validates :password, presence: {
    message: "value missing !!"
  }


  def admin?
    self.role == "admin"
  end

  def climber?
    self.role == "climber"
  end

  def opener?
    self.role == "opener"
  end

end
