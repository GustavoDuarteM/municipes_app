class CitizensController < ApplicationController
  def index
    @citizens = Citizen.all.page(params[:page]).per(5)
  end
end
