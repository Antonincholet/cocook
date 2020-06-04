class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  include PgSearch::Model
  pg_search_scope :search_by_address,
                  against: [:address]

  def index
    if params[:query].present?
      @offers = policy_scope(Offer.near(params[:query], params[:distance] || 30, order: :distance))
    else
      @offers = policy_scope(Offer)
    end

    @markers = @offers.map do |offer|
      {
        lat: offer.latitude,
        lng: offer.longitude,
        infoWindow: render_to_string(partial: "info_windows", locals: { offer: offer }),
        image_url: helpers.asset_url('https://res.cloudinary.com/dxm0jgohk/image/upload/v1591217909/CoCook/map-marker-icon_fq3xdq.png')
      }
    end
  end

  def show;  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @user = current_user
    @offer.user = @user
    authorize @offer
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
    authorize @offer
  end

  def offer_params
    params.require(:offer).permit(:label, :description, :cuisine, :address, :km_perimeter, :rate_per_guest)
  end
end
