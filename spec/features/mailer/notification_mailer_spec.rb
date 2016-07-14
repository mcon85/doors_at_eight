require "rails_helper"

feature 'Venue owner gets email when user creates review' do
  let(:venue) { FactoryGirl.create(:venue) }
  let(:user) { FactoryGirl.create(:user) }
  let(:review) { FactoryGirl.build(:review, body: 'this place is the shit') }
  scenario 'sends an email when a review is created' do
    login_user(user)
    visit new_venue_review_path(venue.id)
    select(review[:rating], from: 'Rating')
    fill_in('Body', with: review[:body])
    click_button('Save Review')
    assert !ActionMailer::Base.deliveries.empty?

    email = ActionMailer::Base.deliveries[0]

    expect(email.subject).to eq "New Review Available For #{venue.name}"
    expect(email.to).to eq([venue.user.email])
    expect(email.html_part.to_s).to include("your venue, #{venue.name}")
    expect(email.html_part.to_s).to include("5")
    expect(email.html_part.to_s).to include("this place is the shit")
  end
end
