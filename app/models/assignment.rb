class Assignment
  include Mongoid::Document
  field :locked, type: Mongoid::Boolean
end
