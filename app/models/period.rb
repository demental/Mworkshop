class Period
  include Mongoid::Document
  field :name, type: String
  field :state, type: String

  embeds_many :workshops
  has_many :wishes
  has_many :assignments

  validates :name, uniqueness: true


end
