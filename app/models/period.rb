class Period
  include Mongoid::Document
  field :name, type: String
  field :state, type: String
  validates :name, uniqueness: true
end
