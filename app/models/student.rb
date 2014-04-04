class Student
  include Mongoid::Document
  field :first_name, type: String
  field :last_name, type: String
  field :happiness, type: Integer

  embeds_many :wishes
  embeds_many :assignments
  belongs_to :group

  delegate :grade, to: :group
end
