class Vote < ActiveRecord::Base
  attr_accessor :message

  belongs_to :user
  belongs_to :review

  VOTES = %w(up down).freeze
  validates :vote_type, presence: true, inclusion: { in: VOTES }
  validates :user_id, presence: true
  validates :review_id, presence: true

  def self.create_or_cancel(user_id, review_id, vote_type)
    vote = Vote.where(user_id: user_id, review: review_id).first

    success_message = "Thanks for #{vote_type}-voting!"

    if vote
      if vote.vote_type == vote_type
        vote.destroy
        vote.message = 'Your vote was removed.'
      else
        vote.update(vote_type: vote_type)
        vote.message = success_message
      end
    else
      vote = Vote.new(user_id: user_id,
                      review_id: review_id,
                      vote_type: vote_type)

      if vote.save
        vote.message = success_message
      else
        vote.message = 'There was a problem saving that upvote.'
      end
    end

    if vote.destroyed?
      nil
    else
      vote
    end
  end
end
