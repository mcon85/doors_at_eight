class VenuesController < ApplicationController
  def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.find(params[:id])
    @reviews = Review.where("venue_id = ?", params[:id])
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)

    if @venue.save
      flash[:success] = 'Venue saved successfully'
      redirect_to venue_path(@venue)
    else
      flash[:alert] = 'Problems saving venue'
      @errors = @venue.errors.full_messages
      render 'venues/new'
    end
  end

  def destroy
    @venue = Venue.find(params[:id])

    if @venue.destroy
      flash[:success] = 'Venue deleted successfully'
      redirect_to venues_path
    else
      flash[:alert] = 'Problems deleting venue'
      redirect_to venue_path(@venue)
    end
  end

  private

  def venue_params
    params.require(:venue).permit(:name,
                                  :address,
                                  :website,
                                  :capacity,
                                  :t_accessible)
  end
end
