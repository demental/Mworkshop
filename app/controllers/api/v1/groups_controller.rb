class Api::V1::GroupsController < ApplicationController
  respond_to :json
  skip_before_action :verify_authenticity_token

  def index
    respond_with Group.all
  end

  def show
    respond_with group
  end

  def create
    respond_with :api, :v1, Group.create(create_params)
  end

  def update
    respond_with group.update_attributes(create_params)
  end

  private

  def group
    Group.find(params[:id])
  end

  def create_params
    params.require(:group).permit(:name, :grade)
  end

end