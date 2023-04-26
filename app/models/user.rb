class User < ApplicationRecord
  has_many :games, dependent: :destroy

  def invalidate_jwt
    self.update(jwt_revoked_at: Time.now)
  end
  
  include Devise::JWT::RevocationStrategies::JTIMatcher
  devise :database_authenticatable, :registerable, :validatable,
         :jwt_authenticatable, :recoverable, :rememberable, jwt_revocation_strategy: self
end
