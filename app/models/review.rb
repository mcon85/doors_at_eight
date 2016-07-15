class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :venue
  has_many :votes, dependent: :destroy

  validates :rating, presence: true,
                     numericality: { only_integer: true,
                                     greater_than_or_equal_to: 1,
                                     less_than_or_equal_to: 5 }

  def short_body
    max = 80
    temp_body = body
    temp_body.length > max ? "#{temp_body[0..max].strip}..." : temp_body
  end

  def vote_count
    votes.all.reduce(0) do |total, vote|
      if vote.vote_type == 'up'
        total + 1
      else
        total - 1
      end
    end
  end
end
