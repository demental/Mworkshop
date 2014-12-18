class WorkshopSerializer < ActiveModel::Serializer
  attributes :id, :name, :instructor, :day, :max_attendees, :assignment_count, :grades

  def id
    object._id.to_s
  end
  def group_id
    object.group_id.to_s
  end

end
