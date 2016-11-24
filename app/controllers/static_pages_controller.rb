class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!
  def home

  end

  def about_class

  end

  def about_teacher

  end
end
