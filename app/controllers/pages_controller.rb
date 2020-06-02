class PagesController < ApplicationController
  def home
  end

  def dashboard
    @user = current_user
    @offers = @user.offers
    @reservations = @user.reservations
  end
end
