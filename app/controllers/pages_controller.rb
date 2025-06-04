class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home # Skip authentication for :home action
  def home
  end
end
