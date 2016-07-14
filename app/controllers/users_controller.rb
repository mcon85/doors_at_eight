class UsersController < ApplicationController
  before_action :authorize_user, except: :show
  before_action :authenticate_user!, except: :index

  def index
    @admin_users = User.all
  end

  def show
    @user = User.find(params[:format])
  end

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
