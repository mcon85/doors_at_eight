class HomepageController < ApplicationController
  def index
    email = "doors-at-eight@mailinator.com"
    TestMailer.test_email(email).deliver_later
  end
end
