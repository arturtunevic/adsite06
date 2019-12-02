class AdController < ApplicationController
  before_action :authenticate_user!, unless: :guest_user

  def show
    @ad = Ad.find(params[:id])
  end

  def create
    @ad = current_user.ads.build(name: params[:name], model: params[:model], mileage: params[:mileage], horsepower: params[:horsepower], fuel: params[:fuel], gearbox: params[:gearbox], price: params[:price])
    @ad.save
    redirect_back fallback_location: root_path
  end

  def update
    @ad = Ad.find(params[:id])
    Ad.update(@ad.id, name: params[:name], model: params[:model], mileage: params[:mileage], horsepower: params[:horsepower], fuel: params[:fuel], gearbox: params[:gearbox], price: params[:price])
    redirect_back fallback_location: root_path
  end

  def delete
    @ad = Ad.find(params[:id])
    Ad.delete(@ad.id)
    redirect_back fallback_location: root_path
  end

  def user_ads
    @user_ads = current_user.ads
  end

end
