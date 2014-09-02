class Workshop
  include Mongoid::Document
  field :name, type: String
  field :instructor, type: String
  field :day, type: String
  field :max_attendees, type: Integer
  field :assignment_count, type: Integer, default: 0
  field :grades, type: Array

  has_many :assignments
  has_many :wishes
  belongs_to :period

  def attendees
    Student.in id: assignments.map(&:student_id)
  end
  alias_method :students, :attendees

  def available?
    assignment_count < max_attendees
  end
end
