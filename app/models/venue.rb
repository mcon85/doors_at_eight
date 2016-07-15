class Venue < ActiveRecord::Base
  include PgSearch

  has_many :reviews, dependent: :destroy
  belongs_to :user

  validates :name, presence: true
  validates :capacity, allow_blank: true,
                       allow_nil: true,
                       numericality: { only_integer: true }
  validates :website, allow_blank: true,
                      allow_nil: true,
                      format: { with: URI.regexp }
  validates :address, presence: true
  validates :t_accessible, inclusion: { in: [true, false] }

  pg_search_scope :search_venue_only, against: [:name, :address]
  scope :search, -> (query) { search_venue_only(query) if query.present? }

  def display_t_accessible
    if t_accessible
      'T is nearby'
    else
      'No nearby T station'
    end
  end

  def short_name
    max = 20
    temp_name = name
    temp_name.length > max ? "#{temp_name[0..max].strip}..." : temp_name
  end
end
