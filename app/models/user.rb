class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, presence: true
  has_secure_password

  def tweet(tweet)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.secrets.consumer_key
      config.consumer_secret     = Rails.application.secrets.consumer_secret
      config.access_token        = Rails.application.secrets.access_token
      config.access_token_secret = Rails.application.secrets.access_token_secret
    end
    binding.pry
    client.update(tweet)
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def admin?
    self.admin
  end

end
