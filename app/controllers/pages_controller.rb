class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  skip_after_action :verify_authorized, only: :home

  def home
  end

  def dashboard
    @user = current_user
    @offers = @user.offers
    @reservations = @user.reservations
    services = Reservation.where(offer:@user.offers)
    @services = services.sort_by{ |element| element.date_time }
  end
end
