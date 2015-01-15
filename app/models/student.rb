class Student
  include Mongoid::Document
  field :name, type: String
  field :happiness, type: Integer

  has_many :wishes
  embeds_many :assignments
  belongs_to :group

  delegate :grade, to: :group

  scope :wishing,
  -> (workshop, weight = nil) do
    where(:id.in  => workshop
      .wishes
      .where(weight ? { weight: weight} : nil)
      .map(&:student_id))
  end
end
