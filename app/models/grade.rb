class Grade
  include Mongoid::Document
  field :name, type: String
  field :weight, type: Integer
end
