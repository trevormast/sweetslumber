class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home

  end

  def about_class

  end

  def about_teacher

  end
end
