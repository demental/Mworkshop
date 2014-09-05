class Api::V1::GradesController < ApplicationController
  respond_to :json
  skip_before_action :verify_authenticity_token

  def index
    respond_with Settings['grades']
  end

  def show
    respond_with grade
  end

  private

  def grade
    Grade.find(params[:id])
  end

end