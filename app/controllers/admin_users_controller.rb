class AdminUsersController < ApplicationController
  before_action :authorize_user
  def index
    @admin_users = User.all
  end

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end