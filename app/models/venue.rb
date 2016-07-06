class Venue < ActiveRecord::Base
  def display_t_accessible
    if t_accessible
      'T is nearby'
    else
      'No nearby T station'
    end
  end
end
