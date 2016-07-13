class NotificationMailer < ApplicationMailer
  default from: 'doors-at-eight@mailinator.com'

  def review_notification(email, venue, review)
    @review = review
    @venue = venue
    # @body = "A new review was left for your venue, #{venue.name}: #{review.body}"
    mail(to: email, subject: "New Review Available For #{@venue.name}")
  end
end
