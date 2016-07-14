require 'rails_helper'

feature 'users cannot edit reviews they did not create', %{
  As user
  I can't edit other users' reviews
  So that I don't mess up other users opinion
} do
  # ACCEPTANCE CRITERIA
  # [X] User cannot edit another user's review
  # [X] User cannot delete another user's review
  # [X] User cannot visit edit form
  # [X] User cannot delete reviews for a venue they created

  let(:user) { FactoryGirl.create(:user) }
  let(:another_user) { FactoryGirl.create(:user) }
  let(:review) { FactoryGirl.create(:review, user: another_user) }

  before do
    login_user(user)
    visit venue_path(review.venue)
  end

  scenario 'user tries to edit a review of another user' do
    within('.reviews') do
      expect(page).not_to have_button('Edit')
    end
  end

  scenario 'users tries to visit the edit page for another user review' do
    visit edit_review_path(review)

    expect(page).to have_content('You do not have permission to complete '\
                                 'that action.')
    expect(current_path).to eq(root_path)
    within('.content') do
      expect(page).not_to have_css('form')
    end
  end

  scenario 'users tries to delete vanue of another user' do
    within('.reviews') do
      expect(page).not_to have_button('Delete')
    end
  end

  scenario 'user tries to delete reviews associated with a venue they made' do
    venue = FactoryGirl.create(:venue, user: user)
    FactoryGirl.create(:review, user: another_user, venue: venue)

    within('.reviews') do
      expect(page).not_to have_button('Delete')
    end
  end
end
