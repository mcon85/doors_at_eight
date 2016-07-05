require "rails_helper"

feature "View all venues" do
  scenario "When user vists page see all venues." do
    venues = FactoryGirl.create_list(:venue, 3)

    visit venues_path

    expect(page).to have_content("Venues")
    venues.each do |venue|
      expect(page).to have_content(venue.name)
    end
  end
end
