class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :destroy]

  def index
    @offers = Offer.all
  end

  def show; end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @user = current_user
    @offer.user = @user
    if @offer.save
      redirect_to offer_path(@offer)
    else
      render :new
    end
  end

  def destroy
    @offer.destroy
    redirect_to dashboard_path
  end

  private

  def set_offer
    @offer = Offer.find(params[:id])
  end

  def offer_params
    params.require(:offer).permit(:label, :description, :cuisine, :address, :km_perimeter, :rate_per_guest)
  end
end
