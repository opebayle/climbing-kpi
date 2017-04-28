class User < ActiveRecord::Base
  has_many :checks
  has_many :routes, :through => :checks

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
