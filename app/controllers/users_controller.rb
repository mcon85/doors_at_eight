class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:format])
  end
end
