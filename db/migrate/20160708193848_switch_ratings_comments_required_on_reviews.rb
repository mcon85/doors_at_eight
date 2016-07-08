class SwitchRatingsCommentsRequiredOnReviews < ActiveRecord::Migration
  def up
    change_column :reviews, :body, :text, null: true
    change_column :reviews, :rating, :integer, null: false
  end

  def down
    change_column :reviews, :body, :text, null: false
    change_column :reviews, :rating, :integer, null: true
  end
end
