class Api::V1::EnumsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    respond_to do |format|
      format.json do
        render text: { grades: Settings['grades'], states: ['future','open', 'closed'] }.to_json
      end
    end
  end

  def show
    respond_with grade
  end

end
