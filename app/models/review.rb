class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :venue

  validates :rating, allow_blank: true,
                     allow_nil: true,
                     numericality: { only_integer: true,
                                     greater_than_or_equal_to: 1,
                                     less_than_or_equal_to: 5 },
  validates :body, presence: true
end
