require 'rails_helper'

feature 'View reviews for a venue', %{
  As a user
  I want to the reviews for a venue
  So that I can see what other people think about the venue
} do
  let!(:venue) { FactoryGirl.create(:venue) }
  let!(:review) { FactoryGirl.create(:review,
                                     venue_id: venue.id,
                                     body: 'I love it here the most')
  }

  scenario 'Sees reviews if the venue has been reviewed' do
    visit venues_path

    click_link(venue.name)

    expect(page).to have_content('5')
    expect(page).to have_content('I love it here the most')
  end
end
