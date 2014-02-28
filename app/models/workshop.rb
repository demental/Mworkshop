class Workshop
  include Mongoid::Document
  field :name, type: String
  field :instructor, type: String
  field :day, type: String
  field :max_attendees, type: Integer
end
