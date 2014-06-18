class Period
  include Mongoid::Document
  field :name, type: String
  field :state, type: String

  has_many :workshops
  has_many :wishes
  has_many :assignments

  validates :name, uniqueness: true

  def available_workshops
    workshops.for_js( 'this.assignment_count < this.max_attendees' )
  end


end
