# Preview all emails at http://localhost:3000/rails/mailers/test_mailer
class TestMailerPreview < ActionMailer::Preview
  def test_mail_preview
    TestMailer.test_email(User.first)
  end
end
