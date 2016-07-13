require 'rails_helper'

feature 'homepage updates with new reviews without refresh', %{
  As a user
  I want to see the newest reviews show up on the homepage automatically
  So that I can see what activity is happening on the site
}, js: true do
  let!(:review) { FactoryGirl.create(:review) }

  scenario 'user sees new review show up on homepage' do
    visit root_path

    check_for_review(review)

    new_review = FactoryGirl.create(:review)
    pusher = PusherService.new('review_channel', 'new_review')
    pusher.trigger({
                     review: {
                               id: new_review.id,
                               body: new_review.body,
                               rating: new_review.rating,
                               venue_name: new_review.venue.name,
                               venue_id: new_review.venue.id,
                               created_at: new_review.created_at
                              }
                    })
    #wait for everything to catch up
    sleep 4
    check_for_review(new_review)
  end
end

def check_for_review(review)
  expect(page).to have_content(review.venue.name)
  expect(page).to have_content(review.rating)
  expect(page).to have_content(review.body)
end
