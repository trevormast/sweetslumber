class UsersController < ApplicationController
  before_action :admin_only

  def index
    @workshops = Workshop.all
  end
end