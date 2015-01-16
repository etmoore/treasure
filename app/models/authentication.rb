class Authentication < ActiveRecord::Base
  belongs_to :user

  def self.from_omniauth(auth)
    where(provider: auth['provider'], uid: auth['uid']).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    user = User.create(
      twitter: auth['info']['nickname'],
    )
    user.authentications.create(
      provider: auth["provider"],
      uid: auth["uid"],
      token: auth["credentials"]["token"],
      secret: auth["credentials"]["secret"],
    )
  end
end
