class StudentSerializer < ActiveModel::Serializer
  attributes :id, :name, :happiness, :group_id

  def id
    object._id.to_s
  end
  def group_id
    object.group_id.to_s
  end

end
