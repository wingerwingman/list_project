class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  has_many :lists 
  has_many :categories, through: :lists
  accepts_nested_attributes_for :lists

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider 
      user.name = auth.info.name
      user.uid = auth.uid 
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

end
