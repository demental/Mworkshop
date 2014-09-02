class StudentSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :happiness, :group

  def id
    object._id.to_s
  end
end