class GroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :grade

  def id
    object._id.to_s
  end
end