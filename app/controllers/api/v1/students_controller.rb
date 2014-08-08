class Api::V1::StudentsController < ApplicationController
  respond_to :json

  def index
    respond_with Student.all
  end

  def show
    respond_with student
  end

  def create
    respond_with :api, :v1, Student.create(create_params)
  end

  def update
    respond_with student.update_attributes(create_params)
  end

  private

  def student
    Student.find(params[:id])
  end

  def create_params
    params.require(:student).permit(:first_name, :last_name)
  end

end