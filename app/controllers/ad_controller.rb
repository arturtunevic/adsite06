# frozen_string_literal: true

# Controller for ads
class AdController < ApplicationController
  before_action :authenticate_user!, unless: :guest_user

  def search
    @found_ads = Ad.where(model: params[:search_model])
  end

  def show
    @ad = Ad.find(params[:id])
  end

  def create
    @ad = current_user.ads.build(ad_params)
    show_messages_save(@ad)
  end

  def update
    @ad = Ad.find(params[:id])
    @ad.update!(ad_params)
    show_messages_update(@ad)
  end

  def delete
    @ad = Ad.find(params[:id])
    Ad.delete(@ad.id)
    redirect_back fallback_location: root_path
  end

  def user_ads
    @user_ads = current_user.ads
  end

  def show_messages_save(ad_object)
    redirect_back fallback_location: root_path
    return if ad_object.save

    flash[:title] = 'Error', flash[:alert] = ad_object.errors.full_messages.join(', ')
  end

  def show_messages_update(ad_object)
    redirect_back fallback_location: root_path
    return if ad_object.errors.count.zero?

    flash[:title] = 'Error', flash[:alert] = ad_object.errors.full_messages.join(', ')
  end

  private

  def ad_params
    params.require(:ad).permit(:name, :model, :mileage, :horsepower, :fuel, :gearbox, :price)
  end
end
