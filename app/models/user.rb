class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  before_create :generate_authentication_token
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reservations
  mount_uploader :avatar, AvatarUploader

  def generate_authentication_token
    self.authentication_token = Devise.friendly_token
  end
end
