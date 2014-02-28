class Wish
  include Mongoid::Document
  field :wish_group, type: Integer
  field :weight, type: Integer
end
