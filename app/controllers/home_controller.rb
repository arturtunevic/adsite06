# frozen_string_literal: true

# Home controller
class HomeController < ApplicationController
  before_action :authenticate_user!, unless: :guest_user

  def index
    @ads = Ad.all
  end
end
