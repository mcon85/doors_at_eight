class AddTimestampToReviews < ActiveRecord::Migration
  def change
    add_timestamps :reviews
  end
end
