module ReviewOptionsHelper
  def populate_ratings
    ReviewOptions.for_select
  end
end
