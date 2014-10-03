class PeriodSerializer < ActiveModel::Serializer
  attributes :id, :name, :state

  def id
    object._id.to_s
  end
end