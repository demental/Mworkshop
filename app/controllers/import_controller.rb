require 'csv'

class ImportController < ApplicationController
  def new

  end

  def create
    # CSV.foreach(filename, :headers => true) do |row|
    #   student.create!(row.to_hash)
    # end
  end

end
