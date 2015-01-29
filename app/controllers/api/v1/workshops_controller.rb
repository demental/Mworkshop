class Api::V1::WorkshopsController < ApplicationController
  respond_to :json
  skip_before_action :verify_authenticity_token

  def index
    respond_with Workshop.all
  end

  def show
    respond_with workshop
  end

  def create
    respond_with :api, :v1, Workshop.create(create_params)
  end

  def update
    respond_with workshop.update_attributes(create_params)
  end

  private

  def workshop
    Workshop.find(params[:id])
  end

  def create_params
    params.require(:workshop).permit(:name, :instructor, :day, :max_attendees, grades:[])
  end

end
