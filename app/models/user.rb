class User < ActiveRecord::Base
  has_secure_password

  validates :email, uniqueness: true
  validates :name, :email, presence: true
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  def self.find_or_create_by_omniauth(fb_auth_hash)
    where(email: fb_auth_hash["info"]["email"]).first_or_create do |user|
      user.name = fb_auth_hash["info"]["name"]
      user.password = SecureRandom.hex
    end
  end

end
