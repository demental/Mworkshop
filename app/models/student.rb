class Student
  include Mongoid::Document
  field :first_name, type: String
  field :last_name, type: String
  field :happiness, type: Integer
end
