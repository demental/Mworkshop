class WishMill
  attr_reader :period
  def initialize(period)
    @period = period
    raise 'Period passed to mill is not a period object' unless period.kind_of? Period
  end

  def call
    2.times do |weight|
      period.workshops.each do |workshop|
        fill workshop, weight
      end
    end
  end

  def fill workshop, weight
    set_assignments workshop, Student.wishing(workshop, weight).order('happiness ASC')
  end

  def set_assignments workshop, students
    students.each do |student|
      return unless workshop.available?
      workshop.assignments << Assignment.new(student: student)
    end
  end
end