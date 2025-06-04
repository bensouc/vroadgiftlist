class PagesController < ApplicationController
  skip_authenticate_user! # Skip authentication for this controller

  def home
  end
end
