class Grade
  include Mongoid::Document
  field :name, type: String
  field :weight, type: Integer

  has_many :groups
  has_and_belongs_to_many :workshops
end
