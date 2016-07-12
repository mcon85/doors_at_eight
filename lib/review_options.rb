class ReviewOptions
  OPTIONS = (1..5)

  def self.for_select
    OPTIONS.map { |rating| [rating, rating] }
  end
end
