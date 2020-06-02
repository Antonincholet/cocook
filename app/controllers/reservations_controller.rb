class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
    @offer = Offer.find(params[:offer_id])
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @reservation.offer = Offer.find(params[:offer_id])
    if @reservation.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def destroy
    set_reservation
    @reservation.destroy
    redirect_to dashboard_path
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:address, :date_time, :guests_count)
  end
end
