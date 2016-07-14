class HomepageController < ApplicationController
  def index
    @reviews = Review.where("body <> ''").order(created_at: :desc).limit(4)
  end
end
