class Venue < ActiveRecord::Base
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :capacity, allow_blank: true,
                       allow_nil: true,
                       numericality: { only_integer: true }
  validates :website, allow_blank: true,
                      allow_nil: true,
                      format: { with: URI.regexp }
  validates :address, presence: true
  validates :t_accessible, inclusion: { in: [true, false] }

  def display_t_accessible
    if t_accessible
      'T is nearby'
    else
      'No nearby T station'
    end
  end
end
