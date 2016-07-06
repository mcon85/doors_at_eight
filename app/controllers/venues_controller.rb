class VenuesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.find(params[:id])
  end
end
