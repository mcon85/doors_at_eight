class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :review

  VOTES = %w(up down).freeze
  validates :vote_type, presence: true, inclusion: { in: VOTES }
  validates :user_id, presence: true
  validates :review_id, presence: true
end
