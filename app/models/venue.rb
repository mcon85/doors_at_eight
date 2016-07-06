class Venue < ActiveRecord::Base
  def display_t_accessible
    if t_accessible
      'T is nearby'
    else
      ''
    end
  end
end
