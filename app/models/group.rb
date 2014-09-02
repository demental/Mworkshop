class Group
  include Mongoid::Document
  field :name, type: String
  field :grade, type: String

  has_many   :students

  validates :grade, inclusion: { in: Settings['grades'] }

end
