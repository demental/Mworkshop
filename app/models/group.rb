class Group
  include Mongoid::Document
  field :name, type: String

  has_many   :students
  belongs_to :grade
end
