class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :venue

  validates :rating, numericality: { only_integer: true,
                                     greater_than_or_equal_to: 1,
                                     less_than_or_equal_to: 5 },
                     allow_blank: true,
                     allow_nil: true
  validates :body, presence: true
end
