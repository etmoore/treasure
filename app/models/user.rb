class User < ActiveRecord::Base
  has_many :authentications

  def tweet(tweet)
    user_access_token = authentications.first['token']
    user_access_token_secret = authentications.first['secret']

    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token        = user_access_token
      config.access_token_secret = user_access_token_secret
    end
    client.update(tweet)
  end

  def admin?
    self.admin
  end

end
