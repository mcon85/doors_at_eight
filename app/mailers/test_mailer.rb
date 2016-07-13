class TestMailer < ApplicationMailer
  default from: 'doors-at-eight@mailinator.com'

  def test_email(email)
    @body = 'please work mailcatcher!'
    mail(to: email, subject: 'Sample Email')
  end
end
