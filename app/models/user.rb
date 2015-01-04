class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, presence: true
  has_secure_password
    
  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def admin?
    self.admin
  end

end
