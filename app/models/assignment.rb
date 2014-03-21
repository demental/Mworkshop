class Assignment
  include Mongoid::Document
  field :locked, type: Mongoid::Boolean

  belongs_to :student
  belongs_to :workshop
  belongs_to :period

end
