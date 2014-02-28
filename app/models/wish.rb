class Wish
  include Mongoid::Document
  field :wish_group, type: Integer
  field :weight, type: Integer

  belongs_to :student
  belongs_to :workshop
  belongs_to :period
end
