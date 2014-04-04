class WishMill
  attr_reader :period
  def initialize(period)
    @period = period
    raise 'Period passed to mill is not a period object' unless period.kind_of? Period
  end

  def call
    2.times do |wishgroup|
      period.workshops.each do |workshop|
        fill workshop, wishgroup
      end
      period.available_workshops.each do |workshop|
        fill_with_unassigned workshop, wishgroup
      end
    end

  end

  def fill workshop, wishgroup
    set_assignments workshop, Student.wishing(workshop, wishgroup).order('happiness ASC')
  end

  def fill_with_unassigned workshop, wishgroup

  end

  def set_assignments workshop, students
    while student = students.next && workshop.available? do
      workshop.assignments << Assignment.build(student: student)
    end
  end
end