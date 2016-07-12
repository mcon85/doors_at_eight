class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reviews, dependent: :destroy
  has_many :votes, dependent: :destroy

  validates :email, presence: true
  validates :username, presence: true

  def admin?
    role == 'admin'
  end

  def check_vote_status_of(review)
    vote = Vote.where(user: self, review: review).first
    if vote
      vote.vote_type
    end
  end
end
