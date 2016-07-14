module ReviewOptionsHelper
  def populate_ratings
    ReviewOptions.for_select.unshift(['Choose a Rating', ''])
  end
end
