require "rails_helper"

describe NotificationMailer, type: :mailer do
  let(:venue) { FactoryGirl.create(:venue) }
  let(:user) { FactoryGirl.create(:user) }
  let(:review) { FactoryGirl.build(:review, body: 'this place is the shit') }
  it 'sends an email when a review is created' do
    email = user.email
    # Send the email, then test that it got queued
    email = NotificationMailer.review_notification(email, venue, review).deliver
    assert !ActionMailer::Base.deliveries.empty?

    # Test the body of the sent email contains what we expect it to
    assert_equal [user.email], email.to
    assert_equal "Welcome to My Awesome Site", email.subject
    assert_match(/<h1>Welcome to example.com, #{user.name}<\/h1>/, email.encoded)
    assert_match(/Welcome to example.com, #{user.name}/, email.encoded)
  end
end
