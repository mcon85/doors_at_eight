class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :review

  VOTES = ["up", "down"].freeze
  validates :vote_type, presence: true, inclusion: { in: VOTES }
end
