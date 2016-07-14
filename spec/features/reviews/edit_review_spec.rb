require 'rails_helper'

feature 'Edit a review' do
  let(:venue) { FactoryGirl.create(:venue) }
  let(:user) { FactoryGirl.create(:user) }
  let!(:review) { FactoryGirl.create(:review, venue: venue, user: user) }

  before do
    login_user(user)
    visit venue_path(venue)
  end

  scenario 'User edits a review' do
    click_button('Edit')
    select('3', from: 'Rating')
    fill_in('Body', with: 'This review has been edited')
    click_button('Save Review')

    within('.review .rating') do
      expect(page).to have_content '3'
    end

    expect(page).to have_content('This review has been edited')

    updated_review = Review.find(review.id)
    expect(updated_review.body).to eq('This review has been edited')
  end

  scenario 'User edits a review and gives it a blank rating' do
    click_button('Edit')
    select('Choose a Rating', from: 'Rating')
    fill_in('Body', with: 'This review is bad')
    old_review = Review.find(review.id)

    click_button('Save Review')

    expect(page).to have_content('Problem saving review')
    expect(old_review.body).to_not be('This review is bad')
  end

  scenario 'unauthenticated user cannot edit a review' do
    logout

    visit edit_review_path(review)

    expect(page).to have_content('You need to sign in or sign up before '\
                                 'continuing')
    expect(current_path).to eq(new_user_session_path)
  end

  scenario 'unauthenticated user cannot see edit button' do
    logout

    visit venue_path(venue)

    expect(page).to_not have_content('Edit')
  end
end
