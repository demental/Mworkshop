class Api::V1::PeriodsController < ApplicationController
  respond_to :json
  skip_before_action :verify_authenticity_token

  def index
    respond_with Period.all
  end

  def show
    respond_with period
  end

  def create
    respond_with :api, :v1, Period.create(create_params)
  end

  def update
    respond_with period.update_attributes(create_params)
  end

  private

  def period
    Period.find(params[:id])
  end

  def create_params
    params.require(:period).permit(:name, :state)
  end

end