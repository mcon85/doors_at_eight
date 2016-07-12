class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true
  validates :username, presence: true, uniqueness: true

  def admin?
    role == 'admin'
  end

  def owner_of?(item)
    admin? || id == item.user_id
  end
end
