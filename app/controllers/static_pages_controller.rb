class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :registered_only, only: :resources

  def home

  end

  def about_class

  end

  def about_teacher

  end

  def resources

  end
end
