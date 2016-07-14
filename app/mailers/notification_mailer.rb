class NotificationMailer < ApplicationMailer
  default from: 'doors-at-eight@mailinator.com'

  def review_notification(email, venue, review)
    @review = review
    @venue = venue
    attachments.inline['doorsateight_nav.jpg'] =
      File.read("#{Rails.root}/app/assets/images/logos/doorsateight_nav.jpg")
    mail(to: email, subject: "New Review Available For #{@venue.name}")
  end
end
