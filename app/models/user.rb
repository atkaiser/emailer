require 'securerandom'

class User < ActiveRecord::Base
  rolify
  attr_accessible :role_ids, :as => :admin
  attr_accessible :provider, :uid, :name, :email, :key, :limit, :sent, :month
  validates_presence_of :name

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.key = SecureRandom.hex(16)
      user.limit = 0
      user.sent = 0
      user.month = Time.now.month
      if auth['info']
         user.name = auth['info']['name'] || ""
         user.email = auth['info']['email'] || ""
      end
    end
  end
  
  def reset_month()
    current_month = Time.now.month
    if self.month != current_month
      self.month = current_month
      self.sent = 0
      self.save
    end
  end

end
