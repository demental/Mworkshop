class Workshop
  include Mongoid::Document
  field :name, type: String
  field :instructor, type: String
  field :day, type: String
  field :max_attendees, type: Integer
  field :assignment_count, type: Integer, default: 0

  has_many :assignments
  has_and_belongs_to_many :grades
  has_many :wishes
  belongs_to :period

  def attendees
    Student.in id: assignments.map(&:student_id)
  end
  alias_method :students, :attendees

end
